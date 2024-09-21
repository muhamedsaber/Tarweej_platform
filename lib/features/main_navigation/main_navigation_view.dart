import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/common_ui/widgets/bottom_nav_bar/app_bottom_navbar.dart';
import 'package:tarweej_platform/features/home/presentation/widgets/home_view_appbar.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: AppBottomNavBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    switch (currentIndex) {
      case 0:
        return homeViewAppBar(context);

      default:
        return AppBar(
          title: const Text("TODO"),
        );
    }
  }

  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return const HomeViewBody();

      default:
        return const Center(
          child: Text("TODO"),
        );
    }
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(""));
  }
}
