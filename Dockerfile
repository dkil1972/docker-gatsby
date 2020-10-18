#this is the base image for a gatsby environment in a container
#use with docker run -ti --rm -p 8000:8000 -p 9000-9000 dkil1972/gatsby /bin/ash
#this will run an interactive container where you can use 
#gatsby-cli to develop and build your application

FROM node:14.14.0-alpine3.12

# Also exposing VSCode debug ports
EXPOSE 8000 9000 9929 9230

RUN apk add --no-cache libpng librsvg libgsf giflib libjpeg-turbo musl autoconf automake libtool nasm \
	&& apk add vips-dev fftw-dev build-base \
        --update-cache  \
        --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/  \
        --repository https://alpine.global.ssl.fastly.net/alpine/edge/main \
	&& apk --no-cache add --virtual .build-dependencies g++ make curl py-pip \
        tar gtk-doc gobject-introspection expat-dev glib-dev libpng-dev \
        libjpeg-turbo-dev giflib-dev librsvg-dev  \
	&& su node \
	&& npm install sharp@${SHARP_VERSION} --g --production --unsafe-perm \
	&& chown node:node /usr/local/lib/node_modules -R \
	&& apk del .build-dependencies \
    && rm -fR /var/cache/apk/*

RUN npm install -g gatsby-cli && \
    npm install -g netlify-cli

WORKDIR /app
CMD ["npm", "-v", "&&"]
