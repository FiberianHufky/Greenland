# Stage No 0 builder

FROM nginx:1.21 AS builder

COPY website /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


# Stage No 1 Final

FROM alpine:latest

COPY --from=builder /etc/nginx/conf.d/default.conf /root/

CMD ["ls", "-la"]