# TeXLive-CI-minimal

TeXLive dockerfile aiming to minimise footprint

## Usage

```shell
# pull image
docker pull ghcr.io/bigcat26/texlive-ci-minimal:master

# convert tex to pdf
docker run -it --rm ghcr.io/bigcat26/texlive-ci-minimal:master -v $(pwd):/root document.tex
```
