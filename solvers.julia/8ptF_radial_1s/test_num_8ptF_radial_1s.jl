include("../_common/header.jl")
include("inidata_num_8ptF_radial_1s.jl")
include("coefs_8ptF_radial_1s.jl")
include("red_7x15_8ptF_radial_1s.jl")

function test_num_8ptF_radial_1s()

    Random.seed!(23)
    stats = ini_stats("8ptF_radial_1s")
    stats.solver = "red_7x15_8ptF_radial_1s"
    stats.nroots = 8
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_8ptF_radial_1s()
            C,U,dU = coefs_8ptF_radial_1s(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_8ptF_radial_1s()