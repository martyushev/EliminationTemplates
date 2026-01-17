include("../_common/header.jl")
include("inidata_num_satellite_triang.jl")
include("coefs_satellite_triang.jl")
include("red_74x104_satellite_triang.jl")
include("red_74x104_colpiv_satellite_triang.jl")

function test_num_satellite_triang()

    Random.seed!(23)
    stats = ini_stats("satellite_triang")
    stats.solver = "red_74x104_satellite_triang"
    stats.nroots = 27
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_satellite_triang()
            C,U,dU = coefs_satellite_triang(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_satellite_triang()