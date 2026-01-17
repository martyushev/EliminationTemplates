include("../_common/header.jl")
include("inidata_num_hyb51f.jl")
include("coefs_hyb51f.jl")
include("red_598x684_hyb51f.jl")

function test_num_hyb51f()

    Random.seed!(23)
    stats = ini_stats("hyb51f")
    stats.solver = "red_598x684_hyb51f"
    stats.nroots = 56
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_hyb51f()
            C,U,dU = coefs_hyb51f(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_hyb51f()