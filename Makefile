all	: DAI.pdf clean open

report	: DAI.pdf clean


DAI.pdf: ./latex/DAI.tex
	@if [ -f 'report.pdf' ]; then mv 'DAI.pdf' './.old_DAI.pdf'; fi
	@echo "Creating new full Report"
	@pdflatex latex/DAI.tex > /dev/null
	@pdflatex latex/DAI.tex > /dev/null
	@echo "Creation Successful"

clean	:
	@echo "Removing excess files"
	@rm -f *.aux *.log *.out 
	
open	:
	open DAI.pdf

PHONY	: full page all clean open
