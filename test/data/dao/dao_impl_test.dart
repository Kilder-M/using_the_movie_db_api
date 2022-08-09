import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:using_the_movie_db_api/app/data/dao/dio_impl.dart';

void main() {
  group('Testing dio implements class: ', () {
    final dioImp = DioImpl().getDio();

    test('Should return base url', () {
      expect(dioImp.options.baseUrl, equals('https://api.themoviedb.org/3/'));
    });

    test('Should return a dio object', () {
      expect(dioImp, isA<Dio>());
    });
  });
}
