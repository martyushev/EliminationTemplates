include("../_common/header.jl")
include("inidata_num_stitching.jl")
include("coefs_stitching.jl")
include("red_6x30_stitching.jl")

function test_num_stitching()

    Random.seed!(23)
    stats = ini_stats("stitching")
    stats.solver = "red_6x30_stitching"
    stats.nroots = 18
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_stitching()
            C,U,dU = coefs_stitching(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_stitching()