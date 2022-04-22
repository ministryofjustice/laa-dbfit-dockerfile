# laa-dbfit-dockerfile
Dockerfile for creating container to run [DbFit](https://dbfit.github.io/dbfit/) application. This docker image of DbFit was created to run on both old macs and the new macs that come with the new M1 chip.

Build & Push to dockerhub:

```
docker build . -t tap-dbfit
docker tag tap-dbfit ministryofjustice/dbfit:3.2-jre11
docker push ministryofjustice/dbfit:3.2-jre11
```
