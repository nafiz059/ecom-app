import '../route_manager.dart';

class AuthMiddleware {
  static guardwithLogin() {
    // if user is already logged in
    if (false) {
      return RouteNames.HOME_PAGE;
    }
    // if user is not logged in
    return RouteNames.LOGIN;
  }
}
