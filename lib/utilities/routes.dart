import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../screens/auth/loginPage.dart';
import '../screens/auth/signuppage.dart';
import '../screens/cancerscreens/excerise.dart';
import '../screens/cancerscreens/intro.dart';
import '../screens/dashboard.dart';

appRoutes() => [
      GetPage(
        name: '/Intro',
        page: () => Intro(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/signup',
        page: () => Signup(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/dashboard',
        page: () => DashBoard(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/Exercise',
        page: () => MyCustomWidget(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (kDebugMode) {
      print(page?.name);
    }
    return super.onPageCalled(page);
  }
}
