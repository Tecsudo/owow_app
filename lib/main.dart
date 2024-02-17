import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'config/router/app_routes.dart';
import 'config/theme/theme.dart';
import 'src/core/constants/app_constant.dart';

void main() {
  runApp(const MyApp());
}

//global variables
// late Size screenSize;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConstant.screenSize = MediaQuery.of(context).size;

    return MaterialApp.router(
      title: 'OWOW',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 361, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: routerConfig,
    );
  }
}
