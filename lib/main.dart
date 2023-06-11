import 'package:ecom_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'route/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (BuildContext context, Widget? child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Authprovider())
        ],
        child: MaterialApp.router(
          routerConfig: RouteManager.routeConfig,
          title: 'Material App',
        ),
      ),
    );
  }
}
