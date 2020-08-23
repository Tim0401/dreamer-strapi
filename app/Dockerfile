FROM strapi/base

WORKDIR /

RUN git clone https://github.com/Tim0401/dreamer-strapi.git

WORKDIR /dreamer-strapi/app
RUN yarn install

ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]