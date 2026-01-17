include("../_common/header.jl")
include("inidata_num_3pra_st0.jl")
include("coefs_3pra_st0.jl")
include("red_12x25_3pra_st0.jl")

function test_num_3pra_st0()

    Random.seed!(23)
    stats = ini_stats("3pra_st0")
    stats.solver = "red_12x25_3pra_st0"
    stats.nroots = 12
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_3pra_st0()
            C,U,dU = coefs_3pra_st0(data)

            S = eval(Meta.parse(stats.solver))(C,data[3][1]^2-1)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_3pra_st0()