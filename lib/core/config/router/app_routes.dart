import 'package:feedback/src/views/auth/register.dart';
import 'package:feedback/src/views/reviews/marketing_question.dart';
import 'package:feedback/src/views/reviews/questions.dart';
import 'package:feedback/src/views/reviews/rating.dart';
import 'package:feedback/src/views/reviews/restaurant.dart';
import 'package:feedback/src/views/reviews/thanks.dart';
import 'package:go_router/go_router.dart';

import '../../../src/views/auth/login.dart';
import '../../../src/views/reviews/coupon.dart';
import '../../../src/views/welcome/welcome.dart';
import 'route_names.dart';

// 🌎 Project imports:

final GoRouter routerConfig = GoRouter(
  initialLocation: RouteNames.restaurant.path,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.welcome.path,
      name: RouteNames.welcome.name,
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: RouteNames.login.path,
      name: RouteNames.login.name,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: RouteNames.register.path,
      name: RouteNames.register.name,
      builder: (context, state) => const Register(),
    ),
    GoRoute(
      path: RouteNames.rating.path,
      name: RouteNames.rating.name,
      builder: (context, state) => const Rating(),
    ),
    GoRoute(
      path: RouteNames.question.path,
      name: RouteNames.question.name,
      builder: (context, state) => const Questions(),
    ),
    GoRoute(
      path: RouteNames.restaurant.path,
      name: RouteNames.restaurant.name,
      builder: (context, state) => const Restaurant(),
    ),
    GoRoute(
      path: RouteNames.marketingQuestion.path,
      name: RouteNames.marketingQuestion.name,
      builder: (context, state) => const MarketingQuestion(),
    ),
    GoRoute(
      path: RouteNames.coupon.path,
      name: RouteNames.coupon.name,
      builder: (context, state) => const Coupon(),
    ),
    GoRoute(
      path: RouteNames.thanks.path,
      name: RouteNames.thanks.name,
      builder: (context, state) => const Thanks(),
    ),
    // GoRoute(
    //     path: '/home',
    //     name: 'home',
    //     builder: (context, state) => const UserDashboard(),
    //     routes: <RouteBase>[
    //       GoRoute(
    //         path: 'pathology',
    //         name: 'pathology',
    //         builder: (context, state) => const PathologyReportListView(),
    //       ),
    //       GoRoute(
    //         path: 'radiology',
    //         name: 'radiology',
    //         builder: (context, state) => const RadiologyReportListView(),
    //       ),
    //       GoRoute(
    //         path: 'appointment',
    //         name: 'appointment',
    //         builder: (context, state) => const AppointmentHome(),
    //       ),
    //       GoRoute(
    //         path: 'complaint',
    //         name: 'complaint',
    //         builder: (context, state) => const ComplaintView(),
    //       ),
    //     ]),
  ],
);



/* 

GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashHome(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const LoginHome(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeIn).animate(animation),
              child: child,
            );
          },
        );
      },
    ),

 */
