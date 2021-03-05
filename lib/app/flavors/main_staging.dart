import '../app_config.dart';

void main() async {
  await AppConfig(
    env: Env.staging,
    apiBaseUrl: 'https://my-api-stg.com',
    appName: 'Njihu-Challenge-Staging',
  ).run();
}
