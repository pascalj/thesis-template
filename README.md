# An Over-Engineered Thesis Template

The first step in actually *writing* a thesis is to procrastinate and create a thesis document setup.

![A screenshot from the output](https://pascal.jungblut.me/images/thesis.png)

This repository is a starting point with a few neat (and some might rightfully say unnecessary) features. You might also
want to check out [the post](https://pascal.jungblut.me/posts/overengineering-thesis-template/) about this repository
with slightly more information.

## Features

- Easy building with Nix or alternatively with a plain Makefile
- Markdown input with Pandoc: references, LaTeX passthrough, ...
- Dynamic image conversion: edit images and have the result in your document, immediately
- Generate plots from data

## Installing and Usage

### Using Nix

It builds as a [Nix](https://nixos.org/) flake. If you have Nix installed, try it! It is as easy as `nix build
github:pascalj/thesis-template`. Or clone the repository and use `nix build <your-repo>`. Locally, just use `nix
build`.

### Git and Makefile

Clone the repository, install all dependencies and call `make`.

#### Dependencies

- Pandoc, `pandoc-crossref` and `pandoc-fignum`
- A complete LaTeX environment
- make

Optionally for the image conversion:

- Inkscape
- Graphviz
- Python
  - numpy
  - matplotlib
- R
  - tidyverse
  - tikzDevice

## About

It uses Pandoc **Markdown** files as **input** and produces a **PDF** file via LaTeX as the **output**. Pandoc Markdown lets you
use LaTeX inline, should you ever have to.

Images are creates from "source" where possible. For example, graphs described in the dot language are compiled to Tex,
SVGs are converted with Inkscape and you can even generate images with Python and R, e.g. with data from CSV files.

## Contributing

If you find anything not working or missing, just send me a PR!
