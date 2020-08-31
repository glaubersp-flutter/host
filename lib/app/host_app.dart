import 'package:flutter/material.dart';
import 'package:host/app/modules/home/home.dart';

import 'modules/login/login.dart';

class HostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Host App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginWidget(),
        '/home': (_) => HomeWidget(),
      },
    );
  }
}
