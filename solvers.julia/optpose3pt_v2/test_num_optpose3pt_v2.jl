include("../_common/header.jl")
include("inidata_num_optpose3pt_v2.jl")
include("coefs_optpose3pt_v2.jl")
include("red_297x356_optpose3pt_v2.jl")

function test_num_optpose3pt_v2()

    Random.seed!(23)
    stats = ini_stats("optpose3pt_v2")
    stats.solver = "red_297x356_optpose3pt_v2"
    stats.nroots = 48
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_optpose3pt_v2()
            C,U,dU = coefs_optpose3pt_v2(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_optpose3pt_v2()