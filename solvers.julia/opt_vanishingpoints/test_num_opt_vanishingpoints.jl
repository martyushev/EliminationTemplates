include("../_common/header.jl")
include("inidata_num_opt_vanishingpoints.jl")
include("coefs_opt_vanishingpoints.jl")
include("red_136x194_opt_vanishingpoints.jl")

function test_num_opt_vanishingpoints()

    Random.seed!(23)
    stats = ini_stats("opt_vanishingpoints")
    stats.solver = "red_136x194_opt_vanishingpoints"
    stats.nroots = 40
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_opt_vanishingpoints()
            C,U,dU = coefs_opt_vanishingpoints(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_opt_vanishingpoints()