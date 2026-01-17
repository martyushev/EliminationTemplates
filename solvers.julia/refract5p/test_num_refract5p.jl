include("../_common/header.jl")
include("inidata_num_refract5p.jl")
include("coefs_refract5p.jl")
include("red_38x58_refract5p.jl")

function test_num_refract5p()

    Random.seed!(23)
    stats = ini_stats("refract5p")
    stats.solver = "red_38x58_refract5p"
    stats.nroots = 16
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_refract5p()
            C,U,dU = coefs_refract5p(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_refract5p()