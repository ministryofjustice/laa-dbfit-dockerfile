# laa-dbfit-dockerfile
Dockerfile for creating container to run [DbFit](https://dbfit.github.io/dbfit/) application. This docker image of DbFit was created to run on both old macs and the new macs that come with the new M1 chip.

Build & Push to dockerhub:

```
docker build . -t tap-dbfit:manifest-amd64
docker tag tap-dbfit:manifest-amd64 ministryofjustice/dbfit:3.2-jre11
docker push ministryofjustice/dbfit:3.2-jre11-amd64
```


Build ARM image:

```
docker build . --platform linux/arm64 -t tap-dbfit:manifest-arm64 --build-arg ARCH=arm64v6/
docker tag tap-dbfit:manifest-arm64 ministryofjustice/dbfit:3.2-jre11
docker push ministryofjustice/dbfit:3.2-jre11-arm64
```

Push manifest to allow multi arch image:

```
docker manifest create ministryofjustice/dbfit:3.2-jre11 --amend ministryofjustice/dbfit:3.2-jre11-arm64 ministryofjustice/dbfit:3.2-jre11-amd64
docker manifest push ministryofjustice/dbfit:3.2-jre11
```
