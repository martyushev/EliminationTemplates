include("../_common/header.jl")
include("inidata_num_relpose_4pt.jl")
include("coefs_relpose_4pt.jl")
include("red_72x108_relpose_4pt.jl")

function test_num_relpose_4pt()

    Random.seed!(23)
    stats = ini_stats("relpose_4pt")
    stats.solver = "red_72x108_relpose_4pt"
    stats.nroots = 20
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_relpose_4pt()
            C,U,dU = coefs_relpose_4pt(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_relpose_4pt()