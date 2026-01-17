include("../_common/header.jl")
include("inidata_num_IOD.jl")
include("coefs_IOD.jl")
include("red_481x561_IOD.jl")

function test_num_IOD()

    Random.seed!(23)
    stats = ini_stats("IOD")
    stats.solver = "red_481x561_IOD"
    stats.nroots = 66
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_IOD()
            C,U,dU = coefs_IOD(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_IOD()