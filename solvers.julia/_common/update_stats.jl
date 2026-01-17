# update solver statistics
function update_stats(stats,Ir,e)

    kr = count(Ir) # number of real roots
    e1 = e[1:end-1]
    k = length(e1)
    err = log10(norm(e1)) # numerical error
    flr = !isempty(e1[e1.>1e-3]) # failure identifier
    if e[k+1] == -1 shrp = -Inf else shrp = log10(e[k]/e[k+1]) end # boundary sharpness

    push!(stats.err,err)
    push!(stats.flr,flr)
    push!(stats.shrp,shrp)
    push!(stats.k,k)
    push!(stats.kr,kr)

    return stats

end