include("../_common/header.jl")
include("inidata_num_relpose_7p_fr.jl")
include("coefs_relpose_7p_fr.jl")
include("red_138x210_relpose_7p_fr.jl")

function test_num_relpose_7p_fr()

    Random.seed!(23)
    stats = ini_stats("relpose_7p_fr")
    stats.solver = "red_138x210_relpose_7p_fr"
    stats.nroots = 68
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_relpose_7p_fr()
            C,U,dU = coefs_relpose_7p_fr(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_relpose_7p_fr()