// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/state_manager.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/configuration.dart';

// Project imports:

final getConfigurationUrl = '${ApiConstants.TMDBBaseUrlV3}/configuration';

class ConfigurationController extends GetxController {
  final dios.Dio dio = dios.Dio();

  var appConfiguration = AppConfiguration().obs;

  @override
  void onInit() {
    _getAppCongfiguration();
    super.onInit();
  }

  void _getAppCongfiguration() async {
    try {
      var params = {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
      };
      dios.Response response = await dio.get(
        getConfigurationUrl,
        queryParameters: params,
      );
      var appConfig = AppConfiguration.fromJson(response.data);
      appConfiguration.value = appConfig;
    } catch (error, stackTrace) {
      printException(error, stackTrace);
    }
  }
}
