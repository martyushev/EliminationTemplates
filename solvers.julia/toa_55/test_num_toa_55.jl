include("../_common/header.jl")
include("inidata_num_toa_55.jl")
include("coefs_toa_55.jl")
include("red_772x832_toa_55.jl")

function test_num_toa_55()

    Random.seed!(23)
    stats = ini_stats("toa_55")
    stats.solver = "red_772x832_toa_55"
    stats.nroots = 42
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_toa_55()
            C,U,dU = coefs_toa_55(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_toa_55()