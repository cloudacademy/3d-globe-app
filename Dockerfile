FROM alpine/git AS builder

RUN mkdir -p /tmp/cloudacademy/globe
RUN git clone https://github.com/cloudacademy/webgl-globe /tmp/cloudacademy/globe

FROM nginx AS runtime

COPY ./deploy.sh /tmp/
RUN chmod +x /tmp/deploy.sh

RUN mkdir -p /tmp/cloudacademy/globe
COPY --from=builder /tmp/cloudacademy/globe /tmp/cloudacademy/globe

EXPOSE 80

CMD ["/bin/bash", "-c", "/tmp/deploy.sh && nginx -g \"daemon off;\""]