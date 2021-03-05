import '../app_config.dart';

void main() async {
  await AppConfig(
    env: Env.production,
    apiBaseUrl: 'https://my-api-prod.com',
    appName: 'Njihu-Challenge-Production',
  ).run();
}
