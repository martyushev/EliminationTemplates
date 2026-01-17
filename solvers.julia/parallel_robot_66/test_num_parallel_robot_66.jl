include("../_common/header.jl")
include("inidata_num_parallel_robot_66.jl")
include("coefs_parallel_robot_66.jl")
include("red_293x362_parallel_robot_66.jl")

function test_num_parallel_robot_66()

    Random.seed!(23)
    stats = ini_stats("parallel_robot_66")
    stats.solver = "red_293x362_parallel_robot_66"
    stats.nroots = 40
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_parallel_robot_66()
            C,U,dU = coefs_parallel_robot_66(data)

            S = eval(Meta.parse(stats.solver))(C,data[3][1])
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_parallel_robot_66()