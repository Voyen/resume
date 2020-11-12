#!/usr/bin/env bash
asciidoctor andrei-sevtsenko-resume.adoc -D ./dist -o index.html
asciidoctor-pdf andrei-sevtsenko-resume.adoc -a pdf-theme=pdf-theme.yml -D ./dist -o andrei-sevtsenko-resume.pdf
