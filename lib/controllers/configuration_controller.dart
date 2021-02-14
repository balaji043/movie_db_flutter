// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/state_manager.dart';

// Project imports:
import '../data/core/api_constants.dart';
import '../data/models/tmdb/sections/configuration.dart';

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
