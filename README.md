#A fully functioning gatsby docker image
To avoid setting up node or gatsby on my local machine I use docker as a development environment.

##Get started
just run the following commmand

docker run -ti --rm -p 8000:8000 -p 9000:9000 -v $(pwd):/app -w "/app" dkil1972/gatsby /bin/ash

this will start an interactive shell environment with gatsby cli pre-installed. You can do the usual gatsby commands new, develop, build and serve.

##NOTE:
When running develop or serve give the -H 0.0.0.0 switch in order for gatsby to be able to listen for requests outside the container. For example

gatsby serve -H 0.0.0.0