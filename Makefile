.PHONY: all

all: plots report

clean:
	rm -rf results/*.dat results/figure/*.png report/count_report.html report/count_report_files 

results/isles.dat: data/isles.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/abyss.dat: data/abyss.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/last.dat: data/last.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/sierra.dat: data/sierra.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/figure/isles.png: results/isles.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/figure/abyss.png: results/abyss.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/figure/last.png: results/last.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/figure/sierra.png: results/sierra.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

plots: results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/sierra.png

report: plots
	quarto render report/count_report.qmd
