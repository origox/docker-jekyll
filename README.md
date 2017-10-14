# docker-jekyll
Dockerfile for jekyll environment with support for github pages.
This image support live reload i.e. will rebuild your site when any file is changed within your site.

## Usage
### Clone this repo
git clone ...

### Build image
docker build  -t jekyllserver .

### Run docker image from your site directory
docker run -p 4000:4000 -v $PWD:/srv/jekyll --rm -it jekyllserver

### Admire your site
Point your browser to localhost:4000
