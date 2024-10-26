import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/views/login_view.dart';
import 'package:tarweej_platform/features/auth/features/main_auth_view.dart';
import 'package:tarweej_platform/core/common_ui/views/app_web_view.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/views/search_images_result_view.dart';

import '../../features/auth/features/phone/presentation/views/change_country_view.dart';
import '../../features/auth/features/phone/presentation/views/otp_verification_view.dart';
import '../../features/auth/features/phone/presentation/views/phone_auth_view.dart';
import '../../features/main_navigation/home/data/models/upsplash_image_model.dart';
import '../../features/main_navigation/home/presentation/views/upsplash_image_view.dart';
import '../../features/main_navigation/main_navigation_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainAuthView:
        return _build(const MainAuthView());
      case Routes.phoneAuthView:
        return _buildWithTransition(const PhoneAuthView());
      case Routes.changeCountryView:
        return _buildWithTransition(const ChangeCountryView());
      case Routes.otpVerificationView:
        return _buildWithTransition(const OTPVerificationView());
      case Routes.loginView:
        return _buildWithTransition(const LoginView());

      case Routes.mainNavigationView:
        return _build(const MainNavigationView());
      case Routes.upSplashImageView:
        final UpsplashImageModel image =
            settings.arguments as UpsplashImageModel;
  
        return _buildWithTransition(UpsplashImageView(
          image: image,
        ));
      case Routes.publisherProfileWebView:
        final args = settings.arguments as String;
        return _buildWithTransition(AppWebView(url: args));
      case Routes.searchImagesResultView:
        return _buildWithTransition(const SearchImagesResultView());
      default:
        return _build(NotFoundScreen(
          routeName: settings.name ?? "",
        ));
    }
  }

  _build(
    Widget widget, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
  }) {
    return MaterialPageRoute(
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
      builder: (context) => widget,
    );
  }

  _buildWithTransition(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$routeName not found"),
      ),
    );
  }
}
