include("../_common/header.jl")
include("inidata_num_p4p_fr_iccv17.jl")
include("coefs_p4p_fr_iccv17.jl")
include("red_28x40_p4p_fr_iccv17.jl")

function test_num_p4p_fr_iccv17()

    Random.seed!(23)
    stats = ini_stats("p4p_fr_iccv17")
    stats.solver = "red_28x40_p4p_fr_iccv17"
    stats.nroots = 12
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_p4p_fr_iccv17()
            C,U,dU = coefs_p4p_fr_iccv17(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_p4p_fr_iccv17()