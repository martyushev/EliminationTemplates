include("../_common/header.jl")
include("inidata_num_toy.jl")
include("coefs_toy.jl")
include("red_14x22_toy.jl")
include("red_14x22_colpiv_toy.jl")

function test_num_toy()

    Random.seed!(23)
    stats = ini_stats("toy")
    stats.solver = "red_14x22_toy"
    stats.nroots = 8
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_toy()
            C,U,dU = coefs_toy(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_toy()