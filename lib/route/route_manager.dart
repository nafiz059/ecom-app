import 'package:ecom_app/Pages/home_page.dart';
import 'package:ecom_app/Pages/login_page.dart';
import 'package:ecom_app/route/middlewares/auth_middlewares.dart';
import 'package:go_router/go_router.dart';

class RouteManager {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.HOME_PAGE,
        path: "/",
        builder: (context, state) => const HomePage(),
        redirect: (context, state) => AuthMiddleware.guardwithLogin(),
      ),
      GoRoute(
        name: RouteNames.LOGIN,
        path: RouteNames.LOGIN,
        builder: (context, state) => const LogInPage(),
      ),
    ],
  );
}

abstract class RouteNames {
  static String HOME_PAGE = "/";
  static String LOGIN = "/login_page";
}
