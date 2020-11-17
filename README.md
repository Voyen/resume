# Resume
This is where I host my personal resume.

## Installation

### Install asciidoctor (Arch)
```
pacman -S asciidoctor
yay -S asciidoctor-pdf
```

For other distros/MacOS/Windows I leave that to you to figure out.

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

Once files are generated locally, copy them to this remote directory. At this point the server should have a directory with the following structure:

```
$HOME
├──docker-compose.yml
└──site
    ├── resume.pdf
    └── index.html
```

While in `$HOME/` run the following to start the services.

```shell
docker-compose up -d
```

Give LetsEncrypt a few minutes to do it's thing (only necessary on the first run), then you should be able to browse to the host you specified in the `docker run` command successfully. The PDF version should now be accessible at `$YOUR_HOST/resume.pdf`

After everything is live to update the resume you just need to run `./generate.sh` and copy the contents of `./dist/` to `$REMOTE/$HOME/site/`, and the changes should be effective immediately.
