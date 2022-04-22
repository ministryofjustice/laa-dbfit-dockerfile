FROM alpine:latest

RUN apk add openjdk11-jre-headless

ENV LANG=C.UTF-8
RUN /bin/sh -c "echo '#!/bin/sh'; echo 'set -e'; echo; echo 'dirname \"$(dirname \"$(readlink -f \"$(which javac || which java)\")\")\"'; " > /usr/local/bin/docker-java-home && chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk/jre
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-11-openjdk/jre/bin:/usr/lib/jvm/java-11-openjdk/bin
ENV JAVA_VERSION=11.0.14
ENV JAVA_ALPINE_VERSION="11.0.14_p9-r0"
RUN /bin/sh -c set -x && apk add --no-cache openjdk11-jre="$JAVA_ALPINE_VERSION" && JAVA_HOME="$(docker-java-home)"

RUN wget https://github.com/dbfit/dbfit/releases/download/v3.2.0/dbfit-complete-3.2.0.zip && unzip dbfit-complete-3.2.0.zip -d ./dbfit

CMD /bin/sh -c 'cd dbfit && ./startFitnesse.sh'