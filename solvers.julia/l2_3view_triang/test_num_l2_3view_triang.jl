include("../_common/header.jl")
include("inidata_num_l2_3view_triang.jl")
include("coefs_l2_3view_triang.jl")
include("red_190x227_l2_3view_triang.jl")

function test_num_l2_3view_triang()

    Random.seed!(23)
    stats = ini_stats("l2_3view_triang")
    stats.solver = "red_190x227_l2_3view_triang"
    stats.nroots = 31
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_l2_3view_triang()
            C,U,dU = coefs_l2_3view_triang(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_l2_3view_triang()