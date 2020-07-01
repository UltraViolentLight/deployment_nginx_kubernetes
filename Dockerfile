FROM nginx:alpine

#WORKDIR /website

COPY /website/index.html /usr/share/nginx/html
COPY /website/index.html /var/www/

EXPOSE 80

# https://stackoverflow.com/questions/24241292/dockerized-nginx-is-not-starting/31507431
CMD ["nginx", "-g", "daemon off;"]
