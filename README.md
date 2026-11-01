# Weather Report

Java 8 / Spring MVC application built with Maven. No database is required by the weather application.

## Local setup (Ubuntu / WSL)

This workspace has Temurin JDK 8 and Maven 3.9.9 installed under `.tools/`.
The `mvn-local` launcher uses these installations without changing system Java settings.
Maven dependencies are cached in `~/.m2/repository`.

Build from the repository directory:

```sh
./mvn-local package
```

Start the development server:

```sh
./mvn-local jetty:run
```

Open http://localhost:8080/ . Stop a foreground server with Ctrl+C.
The build produces `target/weather.war`.
The old Cargo profile references another developer's Tomcat installation; use Jetty for local development.

## Verification and limitations

The WAR build and a home-page HTTP 200 response were verified during setup.
The legacy tests in `test/` reference missing user-service classes and are outside Maven's default test directory; Maven currently runs no tests.
Weather lookups require a working OpenWeather API key. The existing controllers contain a hardcoded key, which should be replaced with external configuration for ongoing use.

The setup smoke-test server, if still running, logs to `.tools/server.log`; its Maven PID is recorded in `.tools/server.pid`.
