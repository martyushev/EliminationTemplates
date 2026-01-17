include("../_common/header.jl")
include("inidata_num_kuramoto_oscillator.jl")
include("coefs_kuramoto_oscillator.jl")
include("red_87x110_kuramoto_oscillator.jl")
include("red_87x110_colpiv_kuramoto_oscillator.jl")

function test_num_kuramoto_oscillator()

    Random.seed!(23)
    stats = ini_stats("kuramoto_oscillator")
    stats.solver = "red_87x110_kuramoto_oscillator"
    stats.nroots = 20
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_kuramoto_oscillator()
            C,U,dU = coefs_kuramoto_oscillator(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_kuramoto_oscillator()