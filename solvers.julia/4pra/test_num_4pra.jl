include("../_common/header.jl")
include("inidata_num_4pra.jl")
include("coefs_4pra.jl")
include("red_12x36_4pra.jl")

function test_num_4pra()

    Random.seed!(23)
    stats = ini_stats("4pra")
    stats.solver = "red_12x36_4pra"
    stats.nroots = 20
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_4pra()
            C,U,dU = coefs_4pra(data)

            S = eval(Meta.parse(stats.solver))(C,data[3][1]^2-1)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_4pra()