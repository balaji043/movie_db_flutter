// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/state_manager.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/configuration.dart';

const getConfigurationUrl = '${ApiConstants.tMDBBaseUrlV3}/configuration';

class ConfigurationController extends GetxController {
  final dios.Dio dio = dios.Dio();

  final appConfiguration = AppConfiguration().obs;

  @override
  void onInit() {
    _getAppCongfiguration();
    super.onInit();
  }

  Future<void> _getAppCongfiguration() async {
    try {
      final params = {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
      };
      final dios.Response response = await dio.get(
        getConfigurationUrl,
        queryParameters: params,
      );
      final appConfig =
          AppConfiguration.fromJson(response.data as Map<String, dynamic>);
      appConfiguration.value = appConfig;
    } catch (error, stackTrace) {
      printException(error, stackTrace);
    }
  }
}
