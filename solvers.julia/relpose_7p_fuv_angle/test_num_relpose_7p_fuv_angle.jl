include("../_common/header.jl")
include("inidata_num_relpose_7p_fuv_angle.jl")
include("coefs_relpose_7p_fuv_angle.jl")
include("red_26x33_relpose_7p_fuv_angle.jl")

function test_num_relpose_7p_fuv_angle()

    Random.seed!(23)
    stats = ini_stats("relpose_7p_fuv_angle")
    stats.solver = "red_26x33_relpose_7p_fuv_angle"
    stats.nroots = 6
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_relpose_7p_fuv_angle()
            C,U,dU = coefs_relpose_7p_fuv_angle(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_relpose_7p_fuv_angle()