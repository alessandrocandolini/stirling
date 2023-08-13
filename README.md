[![CI](https://github.com/alessandrocandolini/stirling/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/stirling/actions/workflows/ci.yml)

# stirling
Notes on the Stirling formula

## Compile

Assuming a standard LaTeX distribution (eg, [texlive](https://tug.org/texlive/) or [MacTeX](https://www.tug.org/mactex/)) and [asymptote](https://asymptote.sourceforge.io/) are installed,
```bash
latexmk -pdflatex stirling.tex
```
Depending on the LaTeX distribution, asymptote might require a separate installation.

One way to install a LaTeX distribution and asymptote is via [nix](https://nixos.org/), for example using an ephemeral `nix-shell` as follows:
```bash
nix-shell -p texlive.combined.scheme-full asymptote
```
(here, the full tex distribution is used)

## CI/CD 

This project uses github actions to ensure at every commit we can generate a pdf file. 
`setup-texlive-action` does not install `asymptote` though, so instead of using the more standard [setup-texlive-action](https://github.com/teatimeguest/setup-texlive-action) this project uses `nix` instead in github actions. A custom location for the nix store is used, in order to cache it using [GH cache](https://github.com/actions/cache). The size of texlive full is quite big, so the cache is ~2GB and takes ~1 minute to load.

The pdf artifact is published in the release tags

## Custom documentclass

The document is typeset using [jheppub](https://jhep.sissa.it/jhep/help/JHEP_TeXclass.jsp). The repo stores a patched version of the original file with only one difference: line 40 is comnented to not load the [natbib package](https://ctan.org/pkg/natbib) which is incompatible with [biber](https://ctan.org/pkg/biber?lang=en). No script is supply to keep the local file up-to-date with recent versions of jhep, manual work is required to do that if/when needed.

## TODO 

From the point of view of the content:
* lot of things  (!) Really a lot

From the point of view of the setup of the project:
* cleanup files and project
* create deterministic nix environment for reproducible builds, with revision number etc 
* set cache key in github actions based on the hash of the nix configuration (at the moment it's hardcoded) 
* maybe try to see if we can avoid "custom" projects (eg, custom jhep files, etc) 
* lot of other things 


