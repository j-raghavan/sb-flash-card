#!/bin/sh

if ! [ -x "$(command -v skt)" ]; then
    echo "Required Package SKT is not installed"
    echo "Please Clone the Repo at https://github.com/wilx/sanskrit.git"
    echo "Follow the README.md to build the skt package and copy it"
    echo "so it is searchable in your $PATH "
    exit 1
fi

if ! [ -x "$(command -v pdflatex)" ]; then
    echo "Required Package PdfLaTeX is not installed"
    echo "Please get pdflatex package for your OS Distribution"
    exit 1
fi

if ! [ -x "$(command -v convert)" ]; then
    echo "Required Package Imgge Magic is not installed"
    echo "Please Install Image Magic package for your Machine"
    exit 1
fi

# Create an Out Directory
mkdir -p ${PWD}/out

cat > ${PWD}/out/header.skt << EOF
\documentclass[18pt]{article}
\pagestyle{plain}
\usepackage[margin=1.8cm]{geometry}
\geometry{a4paper}
\usepackage[parfill]{parskip}
\usepackage{amsmath}
\usepackage{ifthen}
\usepackage{skt}
\begin{document}
\begin{center}

\vspace*{60mm}
\fontsize{350}{360}
\selectfont {\skt VARGA_a}
\newpage

\end{center}
\end{document}
EOF

# Replace VARGA_ Placeholder with the Letter of your Choice
sed -i 's/VARGA_/ka/g' ${PWD}/out/header.skt

# Now Run the Command to convert SKT to TeX format
cd ${PWD}/out 
skt header.skt
pdflatex header.tex
convert -density 300 header.pdf output.png
