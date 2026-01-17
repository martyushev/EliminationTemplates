include("../_common/header.jl")
include("inidata_num_opt_pnp_nakanoC.jl")
include("coefs_opt_pnp_nakanoC.jl")
include("red_78x131_opt_pnp_nakanoC.jl")

function test_num_opt_pnp_nakanoC()

    Random.seed!(23)
    stats = ini_stats("opt_pnp_nakanoC")
    stats.solver = "red_78x131_opt_pnp_nakanoC"
    stats.nroots = 40
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_opt_pnp_nakanoC()
            C,U,dU = coefs_opt_pnp_nakanoC(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_opt_pnp_nakanoC()