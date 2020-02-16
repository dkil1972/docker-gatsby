#this is the base image for a gatsby environment in a container
#use with docker run -ti --rm -p 8000:8000 -p 9000-9000 dkil1972/gatsby /bin/ash
#this will run an interactive container where you can use 
#gatsby-cli to develop and build your application

FROM node:alpine

# Also exposing VSCode debug ports
EXPOSE 8000 9000 9929 9230

RUN apk add --no-cache python make g++ \
 && apk add vips-dev fftw-dev build-base \
        --update-cache \
        --repository https://alpine.global.ssl.fastly.net/alpine/edge/community \
        --repository https://alpine.global.ssl.fastly.net/alpine/edge/main \
 && rm -fR /var/cache/apk/*

RUN npm install -g gatsby-cli

WORKDIR /app
CMD ["npm", "-v", "&&"]