import '../app_config.dart';

void main() async {
  await AppConfig(
    env: Env.qatesting,
    apiBaseUrl: 'https://my-api-qatesting.com',
    appName: 'Njihu-Challenge-QaTesting',
  ).run();
}
