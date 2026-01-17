include("../_common/header.jl")
include("inidata_num_rollingshutter.jl")
include("coefs_rollingshutter.jl")
include("red_40x52_rollingshutter.jl")

function test_num_rollingshutter()

    Random.seed!(23)
    stats = ini_stats("rollingshutter")
    stats.solver = "red_40x52_rollingshutter"
    stats.nroots = 8
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_rollingshutter()
            C,U,dU = coefs_rollingshutter(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_rollingshutter()