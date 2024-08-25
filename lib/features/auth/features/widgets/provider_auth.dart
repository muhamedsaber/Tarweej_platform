import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class ProvidersAuth extends ConsumerWidget {
  const ProvidersAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            ProviderButton(
              imagePath: AppAssets.googleLogo,
              onTap: () {
                ref
                    .read<SingInWithGoogleNotifier>(
                        singInWithGoogleProvider.notifier)
                    .signIn();
              },
            ),
            horizontalSpace(10),
            ProviderButton(
              imagePath: AppAssets.facebookLogo,
              onTap: () {
                ref
                    .read<SingInWithFacebookNotifier>(
                        signInWithFacebookProvider.notifier)
                    .signIn();
              },
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            ProviderButton(
              imagePath: AppAssets.twitterLogo,
              onTap: () {
                ref
                    .read<SingInWithTwitterNotifier>(
                        signInWithTwitterProvider.notifier)
                    .signIn();
              },
            ),
            horizontalSpace(10),
            ProviderButton(
              imagePath: AppAssets.githubLogo,
              onTap: () {
                ref
                    .read<SingInWithGitHubNotifier>(
                        signInWithGitHubProvider.notifier)
                    .signIn();
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
}
