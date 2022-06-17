function make_kdtree(embeddings::Vector{Vector{<:Real}}, dist = Euclidean())
    TM = vectors2matrix(embeddings)
    if in(typeof(dist), [Euclidean, Chebyshev, Minkowski, Cityblock])
        return KDTree(TM, dist)
    else
        return BallTree(TM) # Cannot add the dist for some reason
    end
end
