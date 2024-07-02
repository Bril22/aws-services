FROM --platform=linux/arm64 node:18-bullseye

WORKDIR /nest-server

COPY package*.json ./
RUN npm install
RUN npm rebuild

COPY . .
RUN npx prisma generate
RUN npm run build

EXPOSE 3333

CMD ["npm", "start"]


# FROM node:18-bullseye
# WORKDIR /api-server

# COPY . .


# RUN npm install
# RUN npm run build
# RUN npx prisma generate
# # RUN npx prisma db push
# EXPOSE 3333
# CMD ["npm", "start"]


# RUN chmod +x /api-server/startProduction.sh
# RUN chown root:root startProduction.sh

# CMD /api-server/startProduction.sh