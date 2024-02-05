FROM alpine/git AS build

RUN mkdir -p /tmp/cloudacademy/globe
RUN git clone https://github.com/cloudacademy/webgl-globe /tmp/cloudacademy/globe

FROM nginx

COPY ./deploy.sh /tmp/
RUN chmod +x /tmp/deploy.sh

RUN mkdir -p /tmp/cloudacademy/globe
COPY --from=build /tmp/cloudacademy/globe /tmp/cloudacademy/globe

EXPOSE 80

CMD ["/bin/bash", "-c", "/tmp/deploy.sh && nginx -g \"daemon off;\""]