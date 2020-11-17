# Resume
This is where I host my personal resume.

## Preparation

### Install asciidoctor (Arch)
```
pacman -S asciidoctor
yay -S asciidoctor-pdf
```

For other distros/MacOS/Windows I leave that to you to figure out.

### Set up environment

Update `./.env` file with your own details (assuming you want to use SSH to upload files). 

## Generate Documents

```
./generate.sh
```

## Install on server

This is designed to be hosting agnostic, so the following pre-requisites I leave up to you:

- Linux server online
- Docker installed
- docker-compose installed

Once above is complete, copy contents of `./server/` to desired location (I have it in home directory). Fill out the copied `.env` file on the server to include your email and hostname at which the resume should be accessible.

In order for the docker network to work as intended, run the following

```
docker network create net
```

On server create directory to hold resume static files (I simply have a $HOME/site/). 

Once files are generated locally, copy them to this remote directory. At this point the server should have a directory with the following structure:

```
$HOME
├── .env
├── docker-compose.yml
└── site
    ├── resume.pdf
    └── index.html
```

While in `$HOME/` run the following to start the services.

```shell
docker-compose up -d
```

Give LetsEncrypt a few minutes to do it's thing (only necessary on the first run), then you should be able to browse to the host you specified in the `docker run` command successfully. The PDF version should now be accessible at `$YOUR_HOST/resume.pdf`

## Updating content upstream

After everything is live, to update the resume you just need to run the following (providing you've filled out the `./.env` file correctly) and the changes should be effective immediately

```shell
./generate.sh push
```
