FILES = proposal checkpoint1

all	: $(FILES)

$(FILES): %: %.pdf
	@$(MAKE) clean


%.pdf: ./latex/%.tex
	@if [ -f $@ ]; then rm $@ ; fi
	@echo "Creating new $@"
	@pdflatex $< > /dev/null
	@pdflatex $< > /dev/null
	@echo "Creation Successful"

clean	:
	@echo "Removing excess files"
	@rm -f *.aux *.log *.out 
	

.PHONY	: all clean
