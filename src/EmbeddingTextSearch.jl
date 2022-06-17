module EmbeddingTextSearch

#ENV["PYTHON"] = "/opt/homebrew/bin/python3"
using PyCall
using NearestNeighbors
using Serialization

const SentTransformers = pyimport("sentence_transformers")
const Torch = pyimport("torch")

include("utils.jl")
include("embed.jl")

function command_embed(dirname::String, jsonfile::String, textfield::String)

    if !isdir(dirname)
        @info "Create dir"
        mkdir(dirname)
    else
        error("")
    end

    @info "Extract documents to be embedded"
    @time corpus, sourcedata = extract_documents(jsonfile, textfield)

    embeddings = sentence_transformer_embed(corpus)

    @info "Serialize embeddings to disk"
    @time serialize(joinpath(dirname, "embeddings.juliadata"), embs)

    @info "Create search index"
    @time index = make_kdtree(embeddings)

    @info "Serialize index to disk"
    @time serialize(joinpath(dirname, "index.juliadata"), index)

    @info "Serialize source data to disk"
    @time serialize(joinpath(dirname, "sourcedata.juliadata"), sourcedata)

    # Now perform dimensionality reduction
    
    # Save meta-data for visualisation to csv

    # If it was requested we can also call out to plotly in R and create an interactive
    # visualisation of the embedded docs.

end

end
