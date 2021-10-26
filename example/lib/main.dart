import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vgts_login_example/service/appconfig_service.dart';
import 'package:vgts_login_example/view_page.dart';

import 'helper/firebase_remote_helper.dart';
import 'locator.dart';

Future<Null> main() async {

  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  runZoned<Future<void>>(() async {
    runApp(MyApp());
  });

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewPage(),
    );
  }
}
