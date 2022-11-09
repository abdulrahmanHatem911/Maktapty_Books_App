import 'package:book/core/network/remote/api_constant.dart';
import 'package:dio/dio.dart';

//for get data
//https://api.nytimes.com
///svc/books/v3/lists/2022-01-20/hardcover-fiction.json?
///api-key=AW2W9T2v18ccDGzd7Z4iShihGfxAiR02

//https://api.nytimes.com/svc/books/v3/lists/2022-01-20/hardcover-fiction.json?api-key=YOUR_API_KEY
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
