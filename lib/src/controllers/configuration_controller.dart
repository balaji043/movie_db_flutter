// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/state_manager.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/configuration.dart';

const String getConfigurationUrl =
    '${ApiConstants.tMDBBaseUrlV3}/configuration';

class ConfigurationController extends GetxController {
  final dios.Dio dio = dios.Dio();

  final Rx<AppConfiguration> appConfiguration = AppConfiguration().obs;

  @override
  void onInit() {
    _getAppCongfiguration();
    super.onInit();
  }

  Future<void> _getAppCongfiguration() async {
    try {
      final Map<String, String> params = <String, String>{
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
      };
      final dios.Response<Map<String, String>> response = await dio.get(
        getConfigurationUrl,
        queryParameters: params,
      );
      final AppConfiguration appConfig =
          AppConfiguration.fromJson(response.data);
      appConfiguration.value = appConfig;
    } on Exception catch (error, stackTrace) {
      printException(error, stackTrace);
    }
  }
}
