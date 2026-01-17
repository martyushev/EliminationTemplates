include("../_common/header.jl")
include("inidata_num_opt_pnp_zheng.jl")
include("coefs_opt_pnp_zheng.jl")
include("red_109x161_opt_pnp_zheng.jl")

function test_num_opt_pnp_zheng()

    Random.seed!(23)
    stats = ini_stats("opt_pnp_zheng")
    stats.solver = "red_109x161_opt_pnp_zheng"
    stats.nroots = 40
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_opt_pnp_zheng()
            C,U,dU = coefs_opt_pnp_zheng(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_opt_pnp_zheng()