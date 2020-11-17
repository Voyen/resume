#!/usr/bin/env bash
asciidoctor src/andrei-sevtsenko-resume.adoc -D ./dist -o index.html
asciidoctor-pdf src/andrei-sevtsenko-resume.adoc -a pdf-theme=pdf-theme.yml -D ./dist -o resume.pdf
