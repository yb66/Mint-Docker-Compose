ARG project_name=workspace

FROM alpine:3.12

ARG project_name
ENV PROJECT_NAME=$project_name

RUN apk update && \
    apk upgrade

RUN apk --no-cache add wget su-exec &&\
		wget --no-verbose -O mint https://mint-lang.s3-eu-west-1.amazonaws.com/mint-latest-linux &&\
		chmod +x ./mint &&\
		mv ./mint /usr/local/bin/mint

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /${project_name}

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mint", "start", "--host", "0.0.0.0", "--port", "3000"]
