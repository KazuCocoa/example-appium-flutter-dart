import 'package:appium_driver/async_io.dart';
import 'package:appium_driver/src/common/flutter_finder.dart';

import 'package:test/test.dart';

void main() {
  late AppiumWebDriver driver;

  setUpAll(() async {
    driver = await createDriver(
        uri: Uri.parse('http://127.0.0.1:4723/wd/hub/'),
        desired: {
          'platformName': 'android',
          'appium:automationName': 'uiautomator2',
          // 'appium:automationName': 'flutter',
          'appium:app': 'https://github.com/KazuCocoa/example-appium-flutter-dart/blob/main/apps/app-release-with-key-no-ext.apk?raw=true',
          // 'appium:app': 'https://github.com/KazuCocoa/example-appium-flutter-dart/blob/main/apps/app-debug-with-ext-key.apk?raw=true',
          'appium:udid': 'D0AA002182JC0202126',
          'appium:appPackage': 'com.example.appium_flutter_webinar',
          'appium:fullReset': true,  // to ensure the device under test clean the app under test.
        });
  });

  tearDownAll(() async {
    await driver.quit();
  });

  test('click increment 10 times', () async {
    // UIA2
    var incrementElement = await driver.findElement(
        AppiumBy.accessibilityId('Increment'));

    // Flutter
    // var incrementFinder = AppiumFlutterFinder.byKeyValueString('increment');
    // var incrementElement = driver.getElement(incrementFinder);

    for (var i = 0; i < 10; i++ ) {
      await incrementElement.click();
    }

    try {
      // UIA2
      await driver.findElement(AppiumBy.accessibilityId('10'));

      // Flutter
      // var countFinder = AppiumFlutterFinder.bySemanticsLabel('10');
      // driver.getElement(countFinder);
      assert(true);
    } catch (NoSuchElementException) {
      assert(false);
    }
  });
}
