FROM openjdk:11 AS build

WORKDIR /usr/src/app

COPY my-app/target/*.jar app.jar


FROM openjdk:11-jre-slim

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/app.jar .

CMD ["java","-jar","app.jar"]
