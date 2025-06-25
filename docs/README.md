# How to follow the training 

1. Fork this project 

`git clone`

2. Create your own project and follow the instruction in the pdf document located in *./docs/analytics_engineer.pdf*

3. Make sure to install the following prerequisites.
 
# How to install WSL 2 on Windows

Prerequisites : 

- Windows 10 version 2004 et ultérieure (build 19041 et ultérieure) ou Windows 11

- Get admin rights

Open Powershell and launch this command : `wsl --install`

More information [here](https://learn.microsoft.com/en-us/windows/wsl/install)

# How to install UV (Python Package Manager)

In a terminal, launch `curl -LsSf https://astral.sh/uv/install.sh | sh`

See how to use it [here](https://github.com/astral-sh/uv)

## Install dagster and dbt adapter for bigquery

To install dagster and dbt adapter for bigquery for your project please run this command : `uv add dagster-dbt dbt-bigquery`
 
# Generate PDF 

Please install pandoc and pdflatex

`sudo apt-get install pandoc texlive-latex-base texlive-fonts-recommended texlive-extra-utils texlive-latex-extra texlive-xetex`

Generate pdf from markdown file : 

`pandoc --pdf-engine=xelatex -V "mainfont:DejaVu Sans" -V "monofont:DejaVu Sans Mono" -o docs/analytics_engineer.pdf docs/analytics_engineer.md`
