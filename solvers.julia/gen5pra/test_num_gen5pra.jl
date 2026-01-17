include("../_common/header.jl")
include("inidata_num_gen5pra.jl")
include("coefs_gen5pra.jl")
include("red_34x79_gen5pra.jl")

function test_num_gen5pra()

    Random.seed!(23)
    stats = ini_stats("gen5pra")
    stats.solver = "red_34x79_gen5pra"
    stats.nroots = 44
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_gen5pra()
            C,U,dU = coefs_gen5pra(data)

            S = eval(Meta.parse(stats.solver))(C,data[5][1]^2-1)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_gen5pra()