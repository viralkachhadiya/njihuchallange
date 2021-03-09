import 'package:flutter/material.dart';

import 'app_config.dart';

class GlobleContainerProvider extends ChangeNotifier {
  final Env env;
  final String appName;
  final String apiBaseUrl;
  GlobleContainerProvider(
      {@required this.env, @required this.appName, @required this.apiBaseUrl});
}
