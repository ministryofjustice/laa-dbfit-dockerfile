# laa-dbfit-dockerfile
Dockerfile for creating container to run [DbFit](https://dbfit.github.io/dbfit/) application

Build & Push to dockerhub:

docker build . -t tap-dbfit

docker tag tap-dbfit ministryofjustice/dbfit

docker push ministryofjustice/dbfit:3.2-jre11
