import '../app_config.dart';

void main() async {
  await AppConfig(
    env: Env.development,
    apiBaseUrl: 'https://my-api-dev.com',
    appName: 'Njihu-Challenge-Development',
  ).run();
}
