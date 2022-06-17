# EmbeddingTextSearch

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://robertfeldt.github.io/EmbeddingTextSearch.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://robertfeldt.github.io/EmbeddingTextSearch.jl/dev)
[![Build Status](https://github.com/robertfeldt/EmbeddingTextSearch.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/robertfeldt/EmbeddingTextSearch.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/robertfeldt/EmbeddingTextSearch.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/robertfeldt/EmbeddingTextSearch.jl)

Script that pulls together language model embedding, nearest neighbor search, and visualisation for (semantic) searching for similar text. This is not a package per se and more focused on a CLI binary (see in bin), but since it might grow more useful over time we keep it in a package.

Basically, this takes a json file as input and outputs an index directory with intermediate files for later searching for similar texts. The input json should contain an array of dicts. For more detailed use cases and examples, see below.

## Use cases

The main binary/script is named ``tess``(Text Embedding for Semantic Search).

### tess embed _dirname_ _mydocs.json_ _textfield_

Embed the text in ``textfield`` of dicts in file ``mydocs.json`` and save intermediate files in a directory ``dirname``.

### tess search _dirname_ _newdocs.json_ _textfield_

Search for the closest documents to each of the documents in ``newdocs.json``, given an index in the directory ``dirname``.
