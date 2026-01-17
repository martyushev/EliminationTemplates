function inidata_num_tdoa_pose_5pt()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,5))
    push!(data,randn(1,5))
    return data

end