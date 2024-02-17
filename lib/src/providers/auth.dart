import 'dart:developer';

import 'package:feedback/src/model/auth.dart';

import '../core/constants/app_constant.dart';
import '../core/services/net_services.dart';

Future<bool> userRegistration(
    {required UserInfo info, required String gender}) async {
  final networkService = GenericApi();

  var url = 'https://faraz369.pythonanywhere.com/api/signup/';
  var response = await networkService.postApi(url, body: {
    'email': info.isEnteringPhoneNumber ? info.emailOrPhone : null,
    'phone': info.isEnteringPhoneNumber ? null : info.emailOrPhone,
    'password': info.password,
    'gender': gender
  }, headers: {
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    log(response.body.toString());
    log(response.headers.toString());
  } else {
    log(response.reasonPhrase.toString());
    log(response.body.toString());
  }
  return true;
}

Future<bool> userLogin({required UserInfo info}) async {
  final networkService = GenericApi();

  var url = 'https://faraz369.pythonanywhere.com/api/login/';

  var response = await networkService.postApi(url, body: {
    'email': info.isEnteringPhoneNumber ? info.emailOrPhone : null,
    'phone': info.isEnteringPhoneNumber ? null : info.emailOrPhone,
    'password': info.password,
  }, headers: {
    'Content-Type': 'application/json',
  });
  String x = response['jwt'];
  int id = response['id'];
  log(x, name: 'auth');
  log(id.toString(), name: 'auth');
  AppConstant.jwtToken = x;
  AppConstant.restaurantId = id;
  return true;
}
