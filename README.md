# appium_flutter_webinar

A flutter project for a webinar.
The Appium client is https://pub.dev/packages/appium_driver.

# Setup

```
$ flutter pub get
```

# Run appium test

1. Get Appium server (It requires NodeJS environment)
    ```
    # A Flutter driver versions in appium 1.21.0 has a few issues. Please try out the latest beta.
    # or newer than Appium 1.22.0 (It is in beta on Jun 30, 2021)
    $ npm install -g appium@beta

    # start your local appium server
    $ appium
    ```
2. Runs this test code against the appium server
    ```
    $ dart appium-test/main_test.dart
    ```

# Other appium client libraries to support `finder` in appium-flutter-appium

- https://github.com/truongsinh/appium-flutter-driver/tree/master/example