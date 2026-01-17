include("../_common/header.jl")
include("inidata_num_wpnp.jl")
include("coefs_wpnp.jl")
include("red_85x107_wpnp.jl")
include("red_85x107_colpiv_wpnp.jl")

function test_num_wpnp()

    Random.seed!(23)
    stats = ini_stats("wpnp")
    stats.solver = "red_85x107_wpnp"
    stats.nroots = 16
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_wpnp()
            C,U,dU = coefs_wpnp(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_wpnp()