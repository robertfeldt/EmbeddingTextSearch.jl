using EmbeddingTextSearch
using Documenter

DocMeta.setdocmeta!(EmbeddingTextSearch, :DocTestSetup, :(using EmbeddingTextSearch); recursive=true)

makedocs(;
    modules=[EmbeddingTextSearch],
    authors="Robert Feldt",
    repo="https://github.com/robertfeldt/EmbeddingTextSearch.jl/blob/{commit}{path}#{line}",
    sitename="EmbeddingTextSearch.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://robertfeldt.github.io/EmbeddingTextSearch.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/robertfeldt/EmbeddingTextSearch.jl",
    devbranch="main",
)
