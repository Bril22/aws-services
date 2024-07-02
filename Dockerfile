FROM --platform=linux/arm64 node:18-bullseye

WORKDIR /nest-server

COPY package*.json ./
RUN npm install
RUN npm rebuild

COPY . .
RUN npx prisma generate
RUN npm run build

EXPOSE 3333

ENV DATABASE_URL=postgresql://postgresql123:briltest@rest-api-postgres.c92esiq02by3.ap-southeast-1.rds.amazonaws.com:5436/nest?schema=public
ENV JWT_SECRET=jwt-secret
ENV JWT_REFRESH_SECRET=jwt-refresh-secret
ENV COOKIE_SECRET=secret-cookie
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