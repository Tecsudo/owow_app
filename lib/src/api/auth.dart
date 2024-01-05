import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:feedback/src/model/auth.dart';

Future<bool> userRegistration(
    {required UserInfo info, required String gender}) async {
  log('User Registration API called');

  var headers = {'Content-Type': 'application/json'};
  var body = {
    'email': info.isEnteringPhoneNumber ? info.emailOrPhone : null,
    'phone': info.isEnteringPhoneNumber ? null : info.emailOrPhone,
    'password': info.password,
    'gender': gender
  };
  var response = await http.post(
      Uri.parse('https://faraz369.pythonanywhere.com/api/signup/'),
      headers: headers,
      body: json.encode(body));

  if (response.statusCode == 200) {
    log(response.body.toString());
    log(response.headers.toString());
    // log(response.stream..toString());
  } else {
    log(response.reasonPhrase.toString());
    log(response.body.toString());
  }
  // var request = http.Request(
  //     'POST', Uri.parse('https://faraz369.pythonanywhere.com/api/signup/'));
  // request.body = json.encode(body);

  // request.headers.addAll(headers);
  // http.StreamedResponse response = await request.send();

  // if (response.statusCode == 200) {
  //   log(await response.stream.bytesToString());
  //   log(response.headers.toString());
  //   // log(response.stream..toString());
  // } else {
  //   log(response.reasonPhrase.toString());
  // }
  return true;
}

Future<String> userLogin({required UserInfo info}) async {
  log('User Registration API called');
  log('User Info: ${info.toString()}');
  return '';
}
