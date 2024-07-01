FROM public.ecr.aws/docker/library/node:16

WORKDIR /api-server

COPY . .


RUN npm install
RUN npm run build
RUN npx prisma generate
# RUN npx prisma db push
EXPOSE 3333
CMD ["npm", "start"]


# RUN chmod +x /api-server/startProduction.sh
# RUN chown root:root startProduction.sh

# CMD /api-server/startProduction.sh