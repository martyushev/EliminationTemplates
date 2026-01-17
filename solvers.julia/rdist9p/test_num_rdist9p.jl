include("../_common/header.jl")
include("inidata_num_rdist9p.jl")
include("coefs_rdist9p.jl")
include("red_73x97_rdist9p.jl")

function test_num_rdist9p()

    Random.seed!(23)
    stats = ini_stats("rdist9p")
    stats.solver = "red_73x97_rdist9p"
    stats.nroots = 24
    stats.ntrials = 10^4
    stats.iterref = 0

    for i in 1:stats.ntrials

        toc = @elapsed begin
            data = inidata_num_rdist9p()
            C,U,dU = coefs_rdist9p(data)

            S = eval(Meta.parse(stats.solver))(C)
            S,Ir,e = validate_roots(S,C,U,dU,stats.nroots,stats.iterref)
        end

        stats.tm = [stats.tm; toc]
        stats = update_stats(stats,Ir,e)

    end

    disp_stats(stats)

end

test_num_rdist9p()