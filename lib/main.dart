import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:veggy/base_layout.dart';
import 'package:veggy/configs/configs.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: BaseLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
