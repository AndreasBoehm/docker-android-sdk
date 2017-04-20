# Docker Android build environment
This docker is to build Android Gradle project with Java 8.

Contains:
* OpenJDK 8
* Android SDK: r25.2.3
* Build tools: 25.0.2
* Android API: 25
* Support maven repository
* Google maven repository
* Platform tools

## Build
```bash
docker build andreasboehm/docker-android-sdk:25.2.3 .
```

## Usage
Change directory to your project directory, than run:

```bash
docker run --rm -it --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm andreasboehm/docker-android-sdk:25.2.3  /bin/bash -c "./gradlew build"
```
