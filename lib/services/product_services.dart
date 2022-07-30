import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/my_string.dart';

class ProductServices {
  static Dio? dio;

  static initDioWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl, // 'https://fakestoreapi.com'
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
    debugPrint('===> Dio Web Services was initialized..');
  }

  Future<List<dynamic>> getAllProduct() async {
    try {
      Response response = await dio!.get('products');
      //! print('===> ${response.data}');
      return response.data;
    } catch (e) {
      print('There Was Error ${e.toString()}');
      return [];
    }
  }
}
