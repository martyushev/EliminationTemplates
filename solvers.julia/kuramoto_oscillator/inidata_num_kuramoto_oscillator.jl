function inidata_num_kuramoto_oscillator()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,1))
    push!(data,randn(3,4))
    return data

end