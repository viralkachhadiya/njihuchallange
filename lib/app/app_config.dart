import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:njihuchallenge/app/app.dart';
import 'package:njihuchallenge/app/state_container.dart';
import 'package:njihuchallenge/src/provider/explore_provider.dart';
import 'package:njihuchallenge/src/provider/home_provider.dart';
import 'package:provider/provider.dart';

enum Env {
  development,
  staging,
  production,
  testing,
}

class AppConfig {
  const AppConfig({
    @required this.appName,
    @required this.env,
    @required this.apiBaseUrl,
  });

  final String appName;
  final Env env;
  final String apiBaseUrl;

  Future run() async {
    //WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
      ),
      ChangeNotifierProvider<ExploreProvider>(
          create: (_) => ExploreProvider()
            ..getRandomUser()
            ..getBodyThumbnail())
    ], child: StateContainer(child: App(this.env, this.appName))));
  }
}
