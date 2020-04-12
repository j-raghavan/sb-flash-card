#!/bin/bash

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

generate_skt()
{
l=${letters[$1]}
a=${aksharas[$2]}
gunitha="$l$a"
echo "Output Running for Gunitha ${gunitha}" >> run.log

cat > ${PWD}/out/output.skt << EOF
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
\selectfont {\skt $gunitha}
\newpage
\end{center}
\end{document}
EOF

# Now Run the Command to convert SKT to TeX format
skt ${PWD}/out/output.skt
pdflatex -output-directory=${PWD}/out ${PWD}/out/output.tex
convert -density 300 ${PWD}/out/output.pdf ${PWD}/out/output.png
mkdir -p ${PWD}/out/gunithakshara/png/gunitha-$l
mkdir -p ${PWD}/out/gunithakshara/pdf/gunitha-$l
mv ${PWD}/out/output.png ${PWD}/out/gunithakshara/png/gunitha-$l/$gunitha.png
mv ${PWD}/out/output.pdf ${PWD}/out/gunithakshara/pdf/gunitha-$l/$gunitha.pdf
rm ${PWD}/out/output.*
}

letters=("k" "kh" "g" "gh" "\"n" "c" "ch" "j" "jh" "~n" ".t" ".th" ".d" ".dh" ".n" "t" "th" "d" "dh" "n" "p" "ph" "b" "bh" "m" "y" "r" "l" "v" "s" "\"s" ".s" "h" "k.s")

aksharas=("a" "aa" "i" "ii" "u" "uu" ".r" ".r.r" "e" "ai" "o" "au" "a.m" "a.h")

# 34
# 14
for (( i=0; i<34; i++ ))
do
    for ((j=0; j<14; j++ ))
    do
        generate_skt $i $j
    done
done
