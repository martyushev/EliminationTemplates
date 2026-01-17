include("../_common/header.jl")
include("inidata_num_wpnp_2x2sym.jl")
include("coefs_wpnp_2x2sym.jl")
include("red_10x20_wpnp_2x2sym.jl")

function test_num_wpnp_2x2sym()

    Random.seed!(23)
    stats = ini_stats("wpnp_2x2sym")
    stats.solver = "red_10x20_wpnp_2x2sym"
    stats.nroots = 16
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_wpnp_2x2sym()
            C,U,dU = coefs_wpnp_2x2sym(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_wpnp_2x2sym()