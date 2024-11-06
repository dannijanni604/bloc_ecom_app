import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../config.dart';

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var payload) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(url), body: payload);
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.delete(Uri.parse(url));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        final message = jsonDecode(response.body);
        throw FetchDataException(message['error']);

      case 401:
        throw UnAuthorizedException();

      case 500:
        throw FetchDataException(
            'Error communication with server ${response.statusCode}');

      default:
        throw FetchDataException(
            'Error with status code : ${response.statusCode}');
    }
  }
}
