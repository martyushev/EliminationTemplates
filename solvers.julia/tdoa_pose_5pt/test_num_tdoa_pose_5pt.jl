include("../_common/header.jl")
include("inidata_num_tdoa_pose_5pt.jl")
include("coefs_tdoa_pose_5pt.jl")
include("red_195x237_tdoa_pose_5pt.jl")

function test_num_tdoa_pose_5pt()

    Random.seed!(23)
    stats = ini_stats("tdoa_pose_5pt")
    stats.solver = "red_195x237_tdoa_pose_5pt"
    stats.nroots = 24
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_tdoa_pose_5pt()
            C,U,dU = coefs_tdoa_pose_5pt(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_tdoa_pose_5pt()