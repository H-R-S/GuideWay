import 'dart:convert';
import 'dart:io';
import 'dart:async';
import '../app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'base_api_service.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getApiResponseWithHeader(String url, dynamic header) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 30));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 30));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponseWithHeader(
      String url, dynamic header, dynamic data) async {
    dynamic responseJson;

    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: header, body: data)
          .timeout(const Duration(seconds: 30));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            " Error accured while communication with server! with status code : ${response.statusCode}");
    }
  }
}
