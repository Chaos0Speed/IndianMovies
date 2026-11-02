# Builds the project's LaTeX deliverable. Entry point: `make all`.
FILES = proposal

# `all` just forwards to the names in FILES (currently only the proposal).
all	: $(FILES)

# Static pattern rule: each entry in FILES is an alias depending on its own
# <name>.pdf. Once the PDF is (re)built, `make clean` sweeps the LaTeX aux
# files out of the repo root. Because the alias is only rebuilt when the PDF
# is out of date, clean only fires on actual rebuilds.
$(FILES): %: %.pdf
	@$(MAKE) clean


# Pattern rule: (re)build <name>.pdf from latex/<name>.tex.
# pdflatex runs TWICE because the first pass writes the .aux cross-reference
# data (hyperref links, section numbers) that the second pass reads in.
# The stale PDF is deleted first so a half-finished build can never be
# mistaken for a successful one. Output lands in the repo root (not latex/).
%.pdf: ./latex/%.tex
	@if [ -f $@ ]; then rm $@ ; fi
	@echo "Creating new $@"
	@pdflatex $< > /dev/null
	@pdflatex $< > /dev/null
	@echo "Creation Successful"

# Removes the auxiliary files pdflatex drops in the repo root.
clean	:
	@echo "Removing excess files"
	@rm -f *.aux *.log *.out 
	

.PHONY	: all clean
