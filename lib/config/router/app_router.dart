import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/routes.dart';

class AppRouter {
   Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.home:
        return MaterialPageRoute(builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ));
     
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