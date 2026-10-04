.PHONY: build clean

build:
	latexmk -g -pdf -interaction=nonstopmode -halt-on-error stirling.tex

clean:
	$(RM) $(filter-out stirling.tex,$(wildcard stirling*))
