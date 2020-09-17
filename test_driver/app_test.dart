import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart'; // https://github.com/flutter/flutter/issues/27826

import 'app2_test_driver.dart' as app2;

takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(path);
  await file.writeAsBytes(pixels);
  print(path);
}

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    setUpAll(() async {
      new Directory('screenshots').create();
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
  });

  app2.main();
}
