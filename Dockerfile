#Base Image Node 10
FROM node:10-alpine
#Direktori Kerja
WORKDIR /home/app
#Install PM2 secara global
RUN npm install -g pm2
#Copy semua kode aplikasi
COPY . .
#Install dependency
RUN npm install
#Port 
EXPOSE 3000
#Jalankan dengan PM2 Runtime
CMD ["pm2-runtime", "start", "npm", "--", "start"]
