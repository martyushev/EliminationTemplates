include("../_common/header.jl")
include("inidata_num_relpose_9lines.jl")
include("coefs_relpose_9lines.jl")
include("red_1610x1726_relpose_9lines.jl")

function test_num_relpose_9lines()

    Random.seed!(23)
    stats = ini_stats("relpose_9lines")
    stats.solver = "red_1610x1726_relpose_9lines"
    stats.nroots = 36
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_relpose_9lines()
            C,U,dU = coefs_relpose_9lines(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_relpose_9lines()