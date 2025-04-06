FROM node:buster-slim

ARG SEARXNG_API_URL
ENV SEARXNG_API_URL=${SEARXNG_API_URL}

WORKDIR /home/globsearch.ai

COPY src /home/globsearch.ai/src

COPY tsconfig.json /home/globsearch.ai/
COPY config.toml /home/globsearch.ai/
COPY package.json /home/globsearch.ai/
COPY package-lock.json /home/globsearch.ai/


RUN sed -i "s|SEARXNG = \".*\"|SEARXNG = \"${SEARXNG_API_URL}\"|g" /home/globsearch.ai/config.toml

RUN npm install
RUN npm run build

CMD [ "npm","start" ]