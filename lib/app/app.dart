import 'package:flutter/material.dart';
import 'package:njihuchallenge/src/feature/home.dart';

import 'app_config.dart';

class App extends StatefulWidget {
  final Env env;
  final String appName;
  App(this.env, this.appName);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   StateContainer.of(context).updateGlobalState(
    //       env: this.widget.env, appName: this.widget.appName);
    // });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.white,
          accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      home: Home(),
    );
  }
}
