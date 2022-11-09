import 'package:book/core/network/remote/api_constant.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // to get data
  static Future<Response> getData({
    required String url,
  }) async {
    return await dio!.get(
      url,
    );
  }
}
