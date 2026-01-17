include("../_common/header.jl")
include("inidata_num_8ptF_radial.jl")
include("coefs_8ptF_radial.jl")
include("red_19x39_8ptF_radial.jl")

function test_num_8ptF_radial()

    Random.seed!(23)
    stats = ini_stats("8ptF_radial")
    stats.solver = "red_19x39_8ptF_radial"
    stats.nroots = 16
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_8ptF_radial()
            C,U,dU = coefs_8ptF_radial(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_8ptF_radial()