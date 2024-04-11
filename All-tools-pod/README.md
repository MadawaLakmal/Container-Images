# This Docker image was written to build all in one container that can be usefull to trouble-shoot and setup temporary coding env for devops.

while using you can overide the execution command as you want when the env is changing to docker or kubernetes. That was main purpose of this repo.

Run following command to build your docker image according to your underline architecture.

```
$ docker buid -t all-tools .
```

## Multi-arch images building

For building multi-arch images, you should have docker version > 23.0.0 with the buildx installed. [https://docs.docker.com/engine/install/]

```
### Check docker version and buildx version

$ docker version && docker buildx version
```

```
## Create your own buildx env and use it,

$ docker buildx create --driver-opt network=host --use --name multi-arch-builder
```
```
## Check your builders

$ docker buildx ls
```
```
## Build Muilti-arch images,

$ docker buildx build --platform linux/amd64,linux/arm64 -t multi-arch-image:v1 .
```
You cannot list down docker image after the build using $ docker ls, since those builds are in the build cache. You should push them in to multi-arch supported container registry.

```
## Build and Push images in to registry

$ docker buildx build --platform linux/amd64,linux/arm64 --push -t repo-name/multi-arch-image:v1 .
```
You can use following command for any image to check whether that supports to your undelying arch,

```
## Check your arch 

$ uname -p

## Inspect the image architectures,

$ docker buildx imagetools inspect ubuntu:jammy [replace the ubuntu:jammy with any image]
```

```
## Remove created buildx env (multi-arch-builder)

$ docker buildx rm multi-arch-builder
```
