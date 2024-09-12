
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/helpers/app_assets.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/facebook_auth_provider_impl.dart';
import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/github_auth_provider_impl.dart';
import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/google_auth_provider_impl.dart';

import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/twitter_auth_provider_impl.dart';
import 'package:tarweej_platform/features/auth/services/providers/notifiers/auth_provider_state_notifier.dart';

import '../../../../core/di/dependency_injection.dart';
import 'auth_provider_listener.dart';
part 'provider_button.dart';

class ProvidersAuthSection extends ConsumerWidget {
  const ProvidersAuthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            ProviderButton(
              imagePath: AppAssets.googleLogo,
              onTap: () => _signInWithGoogle(ref),
            ),
            horizontalSpace(10),
            ProviderButton(
                imagePath: AppAssets.facebookLogo,
                onTap: () => _signInWithFacebook(ref)),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            ProviderButton(
              imagePath: AppAssets.twitterLogo,
              onTap: () => _signInWithTwitter(ref),
            ),
            horizontalSpace(10),
            ProviderButton(
              imagePath: AppAssets.githubLogo,
              onTap: () => _signInWithGitHub(ref),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            ProviderButton(
              icon: Icons.phone,
              onTap: () {
                context.navigateTo(Routes.phoneAuthView);
              },
            ),
          ],
        ),
        //----Listeners
        AuthProviderListener(
          providerFamily:
              authProviderStateNotifier(getIt<GoogleAuthProviderImpl>()),
        ),
        AuthProviderListener(
          providerFamily:
              authProviderStateNotifier(getIt<FacebookAuthProviderImpl>()),
        ),
        AuthProviderListener(
          providerFamily:
              authProviderStateNotifier(getIt<TwitterAuthProviderImpl>()),
        ),
        AuthProviderListener(
          providerFamily:
              authProviderStateNotifier(getIt<GitHubAuthProviderImpl>()),
        )
      ],
    );
  }

  //----Triggers

  _signInWithGoogle(WidgetRef ref) {
    ref
        .read(
            authProviderStateNotifier(getIt<GoogleAuthProviderImpl>()).notifier)
        .signIn();
  }

  _signInWithFacebook(WidgetRef ref) {
    ref
        .read(authProviderStateNotifier(getIt<FacebookAuthProviderImpl>())
            .notifier)
        .signIn();
  }

  _signInWithTwitter(WidgetRef ref) {
    ref
        .read(authProviderStateNotifier(getIt<TwitterAuthProviderImpl>())
            .notifier)
        .signIn();
  }

  _signInWithGitHub(WidgetRef ref) {
    ref
        .read(
            authProviderStateNotifier(getIt<GitHubAuthProviderImpl>()).notifier)
        .signIn();
  }
}
