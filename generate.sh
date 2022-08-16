#!/usr/bin/env bash

asciidoctor src/andrei-sevtsenko-resume.adoc -D ./dist -o index.html
asciidoctor-pdf src/andrei-sevtsenko-resume.adoc -a pdf-theme=pdf-theme.yml -D ./dist -o resume.pdf

if [[ $1 = "push" ]]; then

  ENV_CHECK=$(grep -e '=$' .env | wc -l)
  if [[ 0 -eq $ENV_CHECK ]]; then

    . ./.env

    for f in ./dist/*; do
      scp -i $SSH_KEY_LOC -r "$f" $REMOTE_USER@$REMOTE_HOST:$REMOTE_STATIC_FILES_LOC
    done
  else
    echo '.env file cannot have any empty values. Fill it out and try again.'
  fi
fi
