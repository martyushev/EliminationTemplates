# display solver statistics
function disp_stats(stats)

    ir = Bool(stats.iterref) ? "yes" : "no"
    @printf "\n%-35s %35s\n" "Problem:" stats.name
    @printf "%-35s %35s\n" "Solver:" stats.solver
    @printf "%-35s %35d\n" "Number of trials:" stats.ntrials
    @printf "%-35s %35s\n" "Iterative refinement:" ir
    @printf "%-35s %35.2f\n" "Ave. runtime (ms):" 10^3*mean(stats.tm)
    @printf "%-35s %35.2f\n" "Max. num. error:" maximum(stats.err)
    @printf "%-35s %35.2f\n" "Ave. num. error:" mean(stats.err)
    @printf "%-35s %35.2f\n" "Med. num. error:" median(stats.err)
    @printf "%-35s %35.1f\n" "Fails (%):" mean(stats.flr)*100
    @printf "%-35s %35.2f\n" "Ave. sharpness:" mean(stats.shrp)
    @printf "%-35s %35.2f\n" "Med. sharpness:" median(stats.shrp)
    @printf "%-35s %35d\n" "Min. number of roots:" minimum(stats.k)
    @printf "%-35s %35d\n" "Max. number of real roots:" maximum(stats.kr)
    @printf "%-35s %35.1f\n" "Ave. number of real roots:" mean(stats.kr)

end