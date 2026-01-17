include("../_common/header.jl")
include("inidata_num_3v_triang_laurent.jl")
include("coefs_3v_triang_laurent.jl")
include("red_69x127_3v_triang_laurent.jl")
include("red_69x127_colpiv_3v_triang_laurent.jl")

function test_num_3v_triang_laurent()

    Random.seed!(23)
    stats = ini_stats("3v_triang_laurent")
    stats.solver = "red_69x127_3v_triang_laurent"
    stats.nroots = 47
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_3v_triang_laurent()
            C,U,dU = coefs_3v_triang_laurent(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_3v_triang_laurent()