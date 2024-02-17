import 'dart:developer';

import '../core/constants/app_constant.dart';
import '../core/services/net_services.dart';
import '../model/rating.dart';

Future<bool> addRating({
  required RatingData ratingData,
}) async {
  final networkService = GenericApi();

  var url = 'https://faraz369.pythonanywhere.com/api/feedback/';

  var response = await networkService.postApi(url, body: {
    'experience': ratingData.experience,
    'food': ratingData.food,
    'services': ratingData.services,
    'ambiance': ratingData.ambiance,
    'restaurant_id': 1,
  }, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${AppConstant.jwtToken}',
  });
  log(response.body.toString());

  return true;
}
