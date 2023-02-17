# dev-shell-docker

To build:
```
docker build --rm -f Dockerfile -t devenv-baseshell:latest .
```

Create a home directory volume
```
docker volume create home_dir
```

Then run:
```
docker run -v home_dir:/home  -v /path/to/Development:/Development   -it devenv-baseshell:latest /bin/zsh
```
