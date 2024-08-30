import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/helpers/app_assets.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/logic/signin_with_facebook_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/widgets/signin_with_facebook_listener.dart';
import 'package:tarweej_platform/features/auth/features/providers/github/logic/signin_with_github_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/github/widgets/signin_with_github_listener.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/logic/singin_with_google_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/widgets/signin_with_google_listener.dart';
import 'package:tarweej_platform/features/auth/features/providers/twitter/logic/signin_with_twitter_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/twitter/widgets/signin_with_twitter_listener.dart';
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
        const SigninWithGoogleListener(),
        const SigninWithFacebookListener(),
        const SigninWithTwitterListener(),
        const SigninWithGitHubListener()
      ],
    );
  }
  //----Functions

  _signInWithGoogle(WidgetRef ref) {
    ref
        .read<SingInWithGoogleNotifier>(signInWithGoogleProvider.notifier)
        .signIn();
  }

  _signInWithFacebook(WidgetRef ref) {
    ref
        .read<SingInWithFacebookNotifier>(signInWithFacebookProvider.notifier)
        .signIn();
  }

  _signInWithTwitter(WidgetRef ref) {
    ref
        .read<SingInWithTwitterNotifier>(signInWithTwitterProvider.notifier)
        .signIn();
  }

  _signInWithGitHub(WidgetRef ref) {
    ref
        .read<SingInWithGitHubNotifier>(signInWithGitHubProvider.notifier)
        .signIn();
  }
}
