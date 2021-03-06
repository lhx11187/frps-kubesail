FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && curl -L -o /frp.tar.gz --insecure https://github.com/fatedier/frp/releases/download/v0.32.0/frp_0.32.0_linux_amd64.tar.gz \
 && tar -zxvf /frp.tar.gz frp_0.32.0_linux_amd64/frps \
 && mv frp_0.31.2_linux_amd64/frps /usr/bin/frps \
 && chmod +x /usr/bin/frps \
 && rm -rf /frp* frp*
CMD ["/usr/bin/frps", "--token=frp888 --vhost_http_port=80 --vhost_https_port=443 --dashboard_port=7500 --allow_ports=10000-20000 --subdomain_host=lhx11187.usw1.kubesail.org"]
EXPOSE 80 443 7000 7500 10000
