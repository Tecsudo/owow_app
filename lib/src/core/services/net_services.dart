import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GenericApi {
  final JsonDecoder _decoder = const JsonDecoder();
  final JsonEncoder _encoder = const JsonEncoder();
  Future<dynamic> postApi(
    String urlLoader, {
    required Map body,
    required Map<String, String> headers,
  }) async {
    late http.Response response;
    try {
      response = await http.post(
        Uri.parse(urlLoader),
        body: _encoder.convert(body),
        headers: headers,
      );
    } catch (e) {
      log(e.toString(), name: 'Error | GenericApi');
    }
    final int statusCode = response.statusCode;
    final String res = response.body;

    if (statusCode < 200 || statusCode > 400) {
      throw Exception("Error while fetching data");
    }
    return _decoder.convert(res);
  }

  Future<dynamic> getApi(
    String urlLoader, {
    required Map<String, String> headers,
  }) async {
    late http.Response response;
    try {
      response = await http.get(
        Uri.parse(urlLoader),
        headers: headers,
      );
    } catch (e) {
      log(e.toString(), name: 'Error | GenericApi');
    }
    final int statusCode = response.statusCode;
    final String res = response.body;

    if (statusCode < 200 || statusCode > 400) {
      throw Exception("Error while fetching data");
    }
    return _decoder.convert(res);
  }
}
