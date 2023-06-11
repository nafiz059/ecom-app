import 'dart:async';

import 'package:ecom_app/core/constaints/Shared_Preference_Keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_manager.dart';

class AuthMiddleware {
  static FutureOr<String> guardwithLogin() async {
    // if user is already logged in
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(SharedPreferenceKeys.TOKEN);

    if (token != null) {
      return RouteNames.HOME_PAGE;
    }
    // if user is not logged in
    return RouteNames.LOGIN;
  }
}
