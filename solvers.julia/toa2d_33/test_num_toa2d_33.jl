include("../_common/header.jl")
include("inidata_num_toa2d_33.jl")
include("coefs_toa2d_33.jl")
include("red_18x28_toa2d_33.jl")

function test_num_toa2d_33()

    Random.seed!(23)
    stats = ini_stats("toa2d_33")
    stats.solver = "red_18x28_toa2d_33"
    stats.nroots = 8
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_toa2d_33()
            C,U,dU = coefs_toa2d_33(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_toa2d_33()