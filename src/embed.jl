const DefaultLanguageModel = "all-MiniLM-L6-v2"

function sentence_transformer_embed(corpus; 
    embedder = nothing, modelname = DefaultLanguageModel)

    if isnothing(embedder)
        @info "Loading sentence-transformer model $(modelname)."
        @time embedder = SentTransformers.SentenceTransformer(modelname)
    end

    @info "Embedding $(length(corpus)) items."
    @time embeddings = embedder.encode(corpus, convert_to_tensor=true)

    asjuliavectors = map(e -> e.tolist(), embeddings)

    return asjuliavectors, embedder
end