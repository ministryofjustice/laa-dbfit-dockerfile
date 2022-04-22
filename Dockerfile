FROM alpine:latest

RUN apk add openjdk11-jre-headless
RUN wget https://github.com/dbfit/dbfit/releases/download/v3.2.0/dbfit-complete-3.2.0.zip && unzip dbfit-complete-3.2.0.zip -d ./dbfit
RUN chmod +x ./dbfit/startFitnesse.sh

CMD /bin/sh -c 'cd dbfit && ./startFitnesse.sh'