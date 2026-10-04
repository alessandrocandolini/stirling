[![CI](https://github.com/alessandrocandolini/stirling/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/stirling/actions/workflows/ci.yml)

# stirling
Notes on the Stirling formula

## Compile

Assuming a standard LaTeX distribution (eg, [texlive](https://tug.org/texlive/) or [MacTeX](https://www.tug.org/mactex/)) and [asymptote](https://asymptote.sourceforge.io/) are installed,
```bash
latexmk -pdflatex stirling.tex
```
Depending on the LaTeX distribution, asymptote might require a separate installation.

One way to install a LaTeX distribution and asymptote is via [nix](https://nixos.org/), for example using an ephemeral `nix develop` shell as follows:
```bash
nix develop
```
(here, the full tex distribution is used)

To compile directly using the pinned environment, run
```bash
nix develop --no-update-lock-file --command latexmk -pdf -interaction=nonstopmode -halt-on-error stirling.tex
```

## Bibliography

Edit `Qhe.bib`, then regenerate `bibliography.bib` using the rules in `bibtoolrsc`:
```bash
nix develop --no-update-lock-file --command bibtool -r bibtoolrsc -i Qhe.bib -o bibliography.bib
```

## CI/CD 

This project uses github actions to ensure at every commit we can generate a pdf file. 
`setup-texlive-action` does not install `asymptote` though, so instead of using the more standard [setup-texlive-action](https://github.com/teatimeguest/setup-texlive-action) this project uses `nix` instead in github actions. The standard nix store is cached using [nix-community/cache-nix-action](https://github.com/nix-community/cache-nix-action), with a key based on the runner OS, architecture, and hashes of `flake.nix` and `flake.lock`.

The pdf artifact is published in the release tags

## Custom documentclass

The document is typeset using [jheppub](https://jhep.sissa.it/jhep/help/JHEP_TeXclass.jsp). The repo stores a patched version of the original file with only one difference: line 40 is comnented to not load the [natbib package](https://ctan.org/pkg/natbib) which is incompatible with [biber](https://ctan.org/pkg/biber?lang=en). No script is supply to keep the local file up-to-date with recent versions of jhep, manual work is required to do that if/when needed.

## TODO 

From the point of view of the content:
* lot of things  (!) Really a lot

From the point of view of the setup of the project:
* cleanup files and project
* maybe try to see if we can avoid "custom" projects (eg, custom jhep files, etc) 
* lot of other things 


