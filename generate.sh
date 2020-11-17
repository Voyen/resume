#!/usr/bin/env bash

. ./.env

asciidoctor src/andrei-sevtsenko-resume.adoc -D ./dist -o index.html
asciidoctor-pdf src/andrei-sevtsenko-resume.adoc -a pdf-theme=pdf-theme.yml -D ./dist -o resume.pdf


for f in ./dist/*; do
    scp -i $SSH_KEY_LOC -r "$f" $REMOTE_USER@$REMOTE_HOST:$REMOTE_STATIC_FILES_LOC
done
