export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-19.3.2/Contents/Home
export JAVA_HOME=$GRAALVM_HOME
export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-19.3.2/Contents/Home/bin:"$PATH"

./mvnw clean install
docker build . -f src/main/docker/Dockerfile.jvm -t quarkus-employee-jvm:0.0.1-SNAPSHOT

./mvnw clean install -Pnative -Dquarkus.native.container-build=true
docker build . -f src/main/docker/Dockerfile.native -t quarkus-employee-native:0.0.1-SNAPSHOT
