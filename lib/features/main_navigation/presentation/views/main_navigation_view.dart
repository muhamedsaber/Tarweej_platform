import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/views/login_view.dart';

import '../../../../core/common_ui/widgets/app_bottom_navbar.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Navigation'),
      ),
      body: const Center(
        child: Text('Main '),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigateTo(Routes.selectImageView);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
