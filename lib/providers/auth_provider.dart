import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
