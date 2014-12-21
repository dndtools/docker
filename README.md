Docker container for dndtools
===============

### Run instructions:
#### Simple (production):
- Don't download anything manually (beside docker)
- Docker will download the image on the first run
```
# stable v1.0.0
docker run --rm -p 8000:8000 -it -v /local/path/to/dndtools.sqlite:/data/dndtools.sqlite dndtools/dndtools:1.0.0
# git master (not always up to date)
docker run --rm -p 8000:8000 -it -v /local/path/to/dndtools.sqlite:/data/dndtools.sqlite dndtools/dndtools:master
```
- If the sqlite database is empty or partially present, missing tables will be created on first use.
- After initialisation the website is available at http://127.0.0.1:8000 and from the network http://192.168.x.y:8000 

#### With your own dndtools version (for development):
```
docker run --rm -p 8000:8000 -it \
  -v /local/path/to/dndtools.sqlite:/data/dndtools.sqlite \
  -v /local/path/to/your/own/dndtools:/dndtoolsrepo \
  dndtools/dndtools:dev
```
- (same notes as above apply)

##### Updating
```
docker pull dndtools/dndtools:master
docker pull dndtools/dndtools:dev
```

### Configuration variables

Name | Default value
---- | -------------
SECRET_KEY | random generated on startup
RECAPTCHA_PUBLIC | *empty*
RECAPTCHA_PRIVATE | *empty*
(more on request)

Use them like this:
```
docker run --rm -p 8000:8000 -it \
  -v /local/path/to/dndtools.sqlite:/data/dndtools.sqlite \
  -e RECAPTCHA_PUBLIC=something \
  -e RECAPTCHA_PRIVATE="something complex" \
  dndtools/dndtools:1.0.0
```
