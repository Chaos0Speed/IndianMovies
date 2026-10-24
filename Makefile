FILES := $(basename $(notdir $(wildcard ./latex/*.tex)))

all: $(FILES)

$(FILES): %: %.pdf
	@$(MAKE) clean

%.pdf: ./latex/%.tex
	@rm -f $@
	@echo "Creating new $@"
	@pdflatex -interaction=nonstopmode -halt-on-error $< > /dev/null
	@pdflatex -interaction=nonstopmode -halt-on-error $< > /dev/null
	@echo "Creation Successful"

clean:
	@echo "Removing excess files"
	cla@rm -f *.aux *.log *.out

.PHONY: all clean $(FILES)