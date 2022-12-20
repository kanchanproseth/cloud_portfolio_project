import 'dart:convert';

import 'package:dio/dio.dart';

import 'app_exceptions.dart';

class ApiManager {
  Dio? provider;

  Map<String, String> defaultHeader = {'Content-Type': 'application/json'};
  Map<String, String>? headers;

  void setupProvider() {
    provider = Dio();
    // base url
    provider!.options.baseUrl =
        "https://4iss0qbeue.execute-api.us-east-1.amazonaws.com/v1";
    provider!.options.connectTimeout = 60000;
    provider!.options.receiveTimeout = 30000;
    provider!.options.headers =
        (headers == null) ? defaultHeader : mapHeaders();
  }

  Future<dynamic> get(String path) async {
    setupProvider();
    var responseJson;
    try {
      final response = await provider!.get(path);
      responseJson = _returnResponse(response);
    } on DioError {
      throw FetchDataException('Something went wrong!');
    }
    return responseJson;
  }

  Future<dynamic> getByUrl(String url) async {
    setupProvider();
    var responseJson;
    try {
      final response = await provider!.get("");
      responseJson = _returnResponse(response);
    } on DioError {
      throw FetchDataException('Something went wrong!');
    }
    return responseJson;
  }

  Future<dynamic> postContact(Map<String, String> data) async {
    setupProvider();
    var responseJson;
    String url = '';
    try {
      final request = await provider!.post('/contact',
          data: data,
          options: Options(headers: {
            "Host": "4iss0qbeue.execute-api.us-east-1.amazonaws.com",
            "Content-Type": "application/json",
          }));
      responseJson = _returnResponse(request);
    } on DioError catch (e) {
      throw FetchDataException('Something went wrong!');
    }
    return responseJson;
  }

  Map<String, String> mapHeaders() {
    headers!.addAll(defaultHeader);
    return headers!;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var json = response.data;
        return json;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        print(response);
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
