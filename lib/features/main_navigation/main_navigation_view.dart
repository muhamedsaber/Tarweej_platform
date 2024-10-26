import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/common_ui/widgets/bottom_nav_bar/app_bottom_navbar.dart';
import 'package:tarweej_platform/features/main_navigation/search/presentation/widgets/keywords/search_keywords_textfield.dart';
import 'package:tarweej_platform/tarweej_platform_app.dart';

import 'home/presentation/views/home_view_body.dart';
import 'search/presentation/views/search_photos_view_body.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentIndex == 1) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: AppBottomNavBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  AppBar? _buildAppBar() {
    switch (currentIndex) {
      case 0:
        return null;
      case 1:
        return AppBar(
          toolbarHeight: 80.h,
          surfaceTintColor: Colors.transparent,
          title: const SearchKeywordsTextField(),
        );
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
      case 1:
        return const SearchPhotosViewBody();
      default:
        return const Center(
          child: Text("TODO"),
        );
    }
  }
}
