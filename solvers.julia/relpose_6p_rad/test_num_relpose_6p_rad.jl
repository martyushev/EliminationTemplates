include("../_common/header.jl")
include("inidata_num_relpose_6p_rad.jl")
include("coefs_relpose_6p_rad.jl")
include("red_39x95_relpose_6p_rad.jl")

function test_num_relpose_6p_rad()

    Random.seed!(23)
    stats = ini_stats("relpose_6p_rad")
    stats.solver = "red_39x95_relpose_6p_rad"
    stats.nroots = 52
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_relpose_6p_rad()
            C,U,dU = coefs_relpose_6p_rad(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_relpose_6p_rad()