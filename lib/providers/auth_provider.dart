import 'dart:convert';

import 'package:ecom_app/core/constaints/Shared_Preference_Keys.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authprovider with ChangeNotifier {
  bool isLoading = false;
  bool haserror = false;
  String errormessage = "";

  Future<bool> login(String username, String password) async {
    isLoading = true;
    haserror = false;
    notifyListeners();
    http.Response response = await http.post(
        Uri.parse("https://fakestoreapi.com/auth/login"),
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      //Successfully Login
      print(response.body);
      String token = jsonDecode(response.body)["token"];

      //
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      bool isTokenSaved =
          await sharedPreferences.setString(SharedPreferenceKeys.TOKEN, token);
      if (isTokenSaved) {
        print("Token Saved");
      } else {
        print("Failed to Saved");
      }

      return true;
    } else {
      //Login Failed
      print("Login failed\n${response.body}");
      haserror = true;
      errormessage = response.body;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
