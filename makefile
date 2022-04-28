FILENAME=songbook

INPUT_DIR=src
INPUT_PATH=$(INPUT_DIR)/$(FILENAME).tex

OUTPUT_DIR=dist
OUTPUT_PATH=$(OUTPUT_DIR)/$(FILENAME).pdf

LATEX_COMPILATION_CMD=latexmk -xelatex -output-directory=$(OUTPUT_DIR)

all: $(INPUT_PATH)
	make instrument-ukulele
	make instrument-generic

current: $(INPUT_PATH)
	$(LATEX_COMPILATION_CMD) $(INPUT_PATH)

# Example: make instrument-ukulele
instrument-%: $(INPUT_PATH) # Define the current instrument as the desired instrument and compile
	sed -i '' 's/\\def\\instrument{[^}]*}/\\def\\instrument{$*}/' $(INPUT_DIR)/current-instrument.tex
	$(LATEX_COMPILATION_CMD) $(INPUT_PATH)
	mv $(OUTPUT_PATH) $(OUTPUT_DIR)/great-$*-songbook.pdf
	make clean

clean: # Remove every file that is not PDF and remove the generic songbook.pdf if exists
	cd ./$(OUTPUT_DIR); find . -type f ! -iname "*.pdf" -delete; rm -f songbook.pdf;

watch: # Require fswatch (brew install fswatch)
	make current; fswatch -o songbook.tex | xargs -n1 -I{} make current
