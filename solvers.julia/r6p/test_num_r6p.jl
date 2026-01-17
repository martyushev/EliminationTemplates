include("../_common/header.jl")
include("inidata_num_r6p.jl")
include("coefs_r6p.jl")
include("red_66x92_r6p.jl")

function test_num_r6p()

    Random.seed!(23)
    stats = ini_stats("r6p")
    stats.solver = "red_66x92_r6p"
    stats.nroots = 20
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_r6p()
            C,U,dU = coefs_r6p(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_r6p()