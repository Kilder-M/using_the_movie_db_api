import 'package:dio/dio.dart';

abstract class DioInterface {
  Dio getDio(Map<String, dynamic> params);
}
