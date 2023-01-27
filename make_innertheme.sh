#!/bin/bash

# copy base file
cp beamerinnerthemeAAU.raw.sty beamerinnerthemeAAU.sty

# create background image
echo "
\def\insertbackgroundimg{%
\resizebox{1.05\paperwidth}{1.05\paperheight}{
" >> beamerinnerthemeAAU.sty
svg2tikz assets/background.svg | sed -n '/tikzpicture/,/tikzpicture/p' | sed -e 's/c29224e/aau@blue1/g' | sed -e 's/\\globalscale/1/g' >> beamerinnerthemeAAU.sty
echo "}}" >> beamerinnerthemeAAU.sty


# create logo to tikz
echo "
\titlegraphic{
\definecolor{cffffff}{RGB}{255,255,255}
\resizebox{\graphicswidth}{!} {%
" >> beamerinnerthemeAAU.sty
svg2tikz assets/logo.svg | sed -n '/tikzpicture/,/tikzpicture/p' | sed -e 's/\\globalscale/1/g' >> beamerinnerthemeAAU.sty
echo "}}" >> beamerinnerthemeAAU.sty
