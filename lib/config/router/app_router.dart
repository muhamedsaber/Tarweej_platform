import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/dark_theme/dark_theme.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/generated/l10n.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
                title: Text(
              S.of(context).login,
              style: Theme.of(context).font18OnSurfaceBold,
            )),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(' Not Found'),
    );
  }
}
