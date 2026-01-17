include("../_common/header.jl")
include("inidata_num_unsynch_relpose.jl")
include("coefs_unsynch_relpose.jl")
include("red_59x79_unsynch_relpose.jl")

function test_num_unsynch_relpose()

    Random.seed!(23)
    stats = ini_stats("unsynch_relpose")
    stats.solver = "red_59x79_unsynch_relpose"
    stats.nroots = 16
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_unsynch_relpose()
            C,U,dU = coefs_unsynch_relpose(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_unsynch_relpose()