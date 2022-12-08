import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:styli_assignment/utils/custom_exception.dart';

class NetworkManager {
  Future<dynamic> get(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(milliseconds: 20000), onTimeout: () {
        throw AppException(
            exceptionType: ExceptionType.timeout, message: "Network Error");
      });
      final responseJson = _response(response);
      return responseJson;
    } catch (_) {}
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body.toString());
      case 404:
        throw AppException(
            exceptionType: ExceptionType.fileNotFound,
            message: "File Not Found");
      case 401:
        throw AppException(
            exceptionType: ExceptionType.unAuthorized,
            message: "You don't have authorized to see data");
      default:
        throw AppException(
            exceptionType: ExceptionType.general, message: "Try Again");
    }
  }
}
