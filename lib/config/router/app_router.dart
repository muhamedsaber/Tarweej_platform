import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/generated/l10n.dart';

class AppRouter {
   Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.home:
        return MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(
            title:  Text(S.of(context).login)
            ),
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
    return  const Center(
      child: Text(' Not Found'),
    );
  }
}