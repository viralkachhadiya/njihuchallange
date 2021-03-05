import '../app_config.dart';

void main() async {
  await AppConfig(
    env: Env.testing,
    apiBaseUrl: 'https://my-api-testing.com',
    appName: 'Njihu-Challenge-Testing',
  ).run();
}
