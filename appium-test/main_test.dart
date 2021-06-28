import 'package:appium_driver/async_io.dart';
import 'package:test/test.dart';

void main() {
  late AppiumWebDriver driver;

  setUpAll(() async {
    driver = await createDriver(
        uri: Uri.parse('http://127.0.0.1:4723/wd/hub/'),
        desired: {
    'platformName': 'android',
    'automationName': 'uiautomator2',
    'app': 'https://github.com/KazuCocoa/my_flutter_app3/blob/no-flutter-driver/apps/android-release-without-flutter-d/app-release.apk?raw=true',
    'udid': 'D0AA002182JC0202126',
    'packageName': 'com.example.my_flutter_app3'
    });
  });

  tearDownAll(() async {
    await driver.quit();
  });

  test('click increment twice', () async {
    var incrementElement = await driver.findElement(
        AppiumBy.accessibilityId('Increment'));

    await incrementElement.click();
    await incrementElement.click();

    var count = driver.findElements(AppiumBy.accessibilityId('2'));
    expect(await count.length, 1);
  });
}
