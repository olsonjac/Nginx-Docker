## Dockerfile for nginx that runs as non-root user
FROM nginx:latest
RUN apt-get update && apt upgrade -y
RUN addgroup --system nginx && adduser --system --ingroup nginx nginx
RUN chown -R nginx:nginx /var/cache/nginx
RUN chown -R nginx:nginx /var/log/nginx
RUN chown -R nginx:nginx /var/run/*
RUN touch /run/nginx.pid && chown -R nginx:nginx /run/nginx.pid 
RUN chown -R nginx:nginx /etc/nginx
COPY index.html /usr/share/nginx/html/index.html
USER nginx
CMD ["nginx", "-g", "daemon off;"]








