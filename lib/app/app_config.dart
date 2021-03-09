import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:njihuchallenge/app/app.dart';
import 'package:njihuchallenge/app/globle_container_pvr.dart';
import 'package:njihuchallenge/src/provider/explore_provider.dart';
import 'package:njihuchallenge/src/provider/home_provider.dart';
import 'package:provider/provider.dart';

enum Env {
  development,
  staging,
  production,
  qatesting,
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
      ListenableProvider<GlobleContainerProvider>(
          create: (_) => GlobleContainerProvider(
              env: env, appName: appName, apiBaseUrl: apiBaseUrl)),
      ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
      ),
      ChangeNotifierProvider<ExploreProvider>(
          create: (_) => ExploreProvider()
            ..getRandomUser()
            ..getBodyThumbnail())
    ], child: App(this.env, this.appName)));
  }
}
