# devshell-in-docker

To build:
```
docker build --rm -f Dockerfile -t devshell-in-docker:latest .
```

Create a home directory volume
```
docker volume create home_dir
```

Then run:
```
docker run -v home_dir:/home  -v /path/to/Development:/Development   -it devshell-in-docker:latest /bin/zsh
```
