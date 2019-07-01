FROM docker:latest AS dockerImg

RUN apk add --update \
  && apk add python \
  && apk add py-pip 


FROM alpine:latest

WORKDIR /usr/bin/christopher

COPY --from=dockerImg /usr/bin/pip /usr/bin/christopher/
COPY --from=dockerImg /usr/bin/python /usr/bin/christopher/
COPY --from=dockerImg /usr/bin/python2.7 /usr/bin/christopher/