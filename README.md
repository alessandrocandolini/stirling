[![CI](https://github.com/alessandrocandolini/stirling/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/stirling/actions/workflows/ci.yml)

# stirling
Notes on the Stirling formula

## Compile

Assuming a standard LaTeX distribution (eg, texlive) and `asymptote`, 
```
latexmk -pdflatex stirling.tex
```
(Depending on the LaTeX distribution, asymptote might require independent installation.)

One way to install a LaTeX distribution is via `nix`, for example using an ephemeral nix shell: 
```
nix-shell -p texlive.combined.scheme-full asymptote
```
(the full distribution is used)

## CI/CD 

This project uses github actions. `setup-texlive-action` does not install asymptote though, so instead of using `setup-texlive-action` the project uses `nix` also in github actions. A custom location for the nix store is used, in order to cache it. The size of texlive full is quite big, so the cache is ~2GB and takes ~1 minute to load. 

The artifact is published in the release tags

## TODO 

From the point of view of the content:
* lot of things 

From the point of view of the setup of the project:
* cleanup files and project
* create deterministic nix environment for reproducible builds, with revision number etc 
* set cache key in github actions based on the hash of the nix configuration (at the moment it's hardcoded) 
* maybe try to see if we can avoid "custom" projects (eg, custom jhep files, etc) 
* lot of other things 


