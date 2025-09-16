LaTeX template and build instructions

This folder contains a simple LaTeX template (`main.tex`) suitable for articles and short reports.

Building on Windows (PowerShell):

Prerequisites:
- Install a TeX distribution, for example MiKTeX (https://miktex.org) or TeX Live (https://tug.org/texlive/).
- Optionally install `latexmk` for a simple rebuild workflow.

Quick build using pdflatex (two passes recommended for references):

```powershell
cd \"$PSScriptRoot\"\n# from repository root to latex folder
cd latex
pdflatex main.tex
pdflatex main.tex
```

Using latexmk (recommended if installed):

```powershell
cd latex
latexmk -pdf main.tex
```

Notes:
- Edit `main.tex` to replace title, author, and add your content.
- Uncomment and set `\includegraphics{...}` for figures and ensure images are in the same directory or give a relative path.
- For bibliography management consider using BibTeX or biblatex depending on your workflow.
