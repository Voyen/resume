# Resume
This is where I host my personal resume.

## Installation

### Install asciidoctor (Arch)
```
pacman -S asciidoctor
yay -S asciidoctor-pdf
```

## Generate Documents

```
./generate.sh
```

## Install on server

This is designed to be hosting agnostic, so the following pre-requisites I leave up to you:

- Linux server online
- Docker installed
- docker-compose installed

Once above is complete, copy `./server/docker-compose.yml` to desired location (I have it in home directory)

In order for the docker network to work as intended, run the following

```
docker network create net
```

On server create directory to hold resume static files (I simply have a $HOME/site/). 

Once files are generated locally, copy them to this remote directory along with `./server/Dockerfile`. Note that the directories in the Dockerfile are relative to the dockerfile on the server, so this repo's structure is irrelevant.

At this point the server should have a directory with the following structure:

```
$HOME
└──site
    ├── andrei-sevtsenko-resume.pdf
    ├── Dockerfile
    └── index.html
```

While in `$HOME/` run the following to start the services.

```shell
docker-compose up -d
```

Browse to `$HOME/site/` and run (replacing the hostnames with your own)

```shell
docker stop resume # for subsequent updates, not needed for first run
docker build -t resume .
docker run --rm --name resume -e VIRTUAL_HOST=resume.voyen.io -e LETSENCRYPT_HOST=resume.voyen.io -e VIRTUAL_PORT=80 --network net -d resume
```

Alternatively, just drop the above into a bash script and execute that whenever you need to update the content.

Give LetsEncrypt a few minutes to do it's thing (only necessary on the first run), then you should be able to browse to the host you specified in the `docker run` command successfully. The PDF version should now be accessible at `$YOUR_HOST/resume.pdf`
