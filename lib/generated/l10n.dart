// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Create `
  String get create {
    return Intl.message(
      'Create ',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Your Account`
  String get yourAccount {
    return Intl.message(
      'Your Account',
      name: 'yourAccount',
      desc: '',
      args: [],
    );
  }

  /// `to continue`
  String get toContinue {
    return Intl.message(
      'to continue',
      name: 'toContinue',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters`
  String get isPasswordContainsAtLeast8Characters {
    return Intl.message(
      'Password must contain at least 8 characters',
      name: 'isPasswordContainsAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 number`
  String get isPasswordContainsAtLeast1Number {
    return Intl.message(
      'Password must contain at least 1 number',
      name: 'isPasswordContainsAtLeast1Number',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 uppercase letter`
  String get isPasswordContainsAtLeast1UpperCaseLetter {
    return Intl.message(
      'Password must contain at least 1 uppercase letter',
      name: 'isPasswordContainsAtLeast1UpperCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 lowercase letter`
  String get isPasswordContainsAtLeast1LowerCaseLetter {
    return Intl.message(
      'Password must contain at least 1 lowercase letter',
      name: 'isPasswordContainsAtLeast1LowerCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 special character`
  String get isPasswordContainsAtLeast1SpecialCharacter {
    return Intl.message(
      'Password must contain at least 1 special character',
      name: 'isPasswordContainsAtLeast1SpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Password is valid`
  String get passwordIsValid {
    return Intl.message(
      'Password is valid',
      name: 'passwordIsValid',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get Egypt {
    return Intl.message(
      'Egypt',
      name: 'Egypt',
      desc: '',
      args: [],
    );
  }

  /// `We will send you a code to confirm your phone number`
  String get WeWillSendYouACodeToConfirmYourPhoneNumber {
    return Intl.message(
      'We will send you a code to confirm your phone number',
      name: 'WeWillSendYouACodeToConfirmYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Choose your country`
  String get chooseYourCountry {
    return Intl.message(
      'Choose your country',
      name: 'chooseYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Enter your code`
  String get EnterYourCode {
    return Intl.message(
      'Enter your code',
      name: 'EnterYourCode',
      desc: '',
      args: [],
    );
  }

  /// `We sent a 6-digit code to`
  String get WeSentASixdigitCodeTo {
    return Intl.message(
      'We sent a 6-digit code to',
      name: 'WeSentASixdigitCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `The code is invalid. Check the code and try again`
  String get TheCodeIsInvalidCheckTheCodeAndTryAgain {
    return Intl.message(
      'The code is invalid. Check the code and try again',
      name: 'TheCodeIsInvalidCheckTheCodeAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get EnterValidPhoneNumber {
    return Intl.message(
      'Enter a valid phone number',
      name: 'EnterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone numbers must be at least `
  String get PhoneNumbersMustBeAtLeast {
    return Intl.message(
      'Phone numbers must be at least ',
      name: 'PhoneNumbersMustBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `digits`
  String get digits {
    return Intl.message(
      'digits',
      name: 'digits',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get EnterYourNewPassword {
    return Intl.message(
      'Enter your new password',
      name: 'EnterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get CheckYourEmail {
    return Intl.message(
      'Check your email',
      name: 'CheckYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to login instead?`
  String get doYouWantToLoginInstead {
    return Intl.message(
      'Do you want to login instead?',
      name: 'doYouWantToLoginInstead',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message(
      'Dismiss',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Go to login`
  String get goToLogin {
    return Intl.message(
      'Go to login',
      name: 'goToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `No photos access`
  String get noPhotosAccess {
    return Intl.message(
      'No photos access',
      name: 'noPhotosAccess',
      desc: '',
      args: [],
    );
  }

  /// `No storage access`
  String get noStorageAccess {
    return Intl.message(
      'No storage access',
      name: 'noStorageAccess',
      desc: '',
      args: [],
    );
  }

  /// `To continue, Tarweej needs access to the photos on your device`
  String get toContinuetarweejNeedsAccessToThePhotosOnYourDevice {
    return Intl.message(
      'To continue, Tarweej needs access to the photos on your device',
      name: 'toContinuetarweejNeedsAccessToThePhotosOnYourDevice',
      desc: '',
      args: [],
    );
  }

  /// `To continue, Tarweej needs access to the storage on your device`
  String get toContinuetarweejNeedsAccessToTheStorageOnYourDevice {
    return Intl.message(
      'To continue, Tarweej needs access to the storage on your device',
      name: 'toContinuetarweejNeedsAccessToTheStorageOnYourDevice',
      desc: '',
      args: [],
    );
  }

  /// `Give permission`
  String get givePermission {
    return Intl.message(
      'Give permission',
      name: 'givePermission',
      desc: '',
      args: [],
    );
  }

  /// `You must go to settings and give storage permission`
  String get youMustGoToSettingsAndGiveStoragePermission {
    return Intl.message(
      'You must go to settings and give storage permission',
      name: 'youMustGoToSettingsAndGiveStoragePermission',
      desc: '',
      args: [],
    );
  }

  /// `Allow access to photos`
  String get allowAccessToPhotos {
    return Intl.message(
      'Allow access to photos',
      name: 'allowAccessToPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Open settings`
  String get openSettings {
    return Intl.message(
      'Open settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Search photos`
  String get searchPhotos {
    return Intl.message(
      'Search photos',
      name: 'searchPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for sharing`
  String get thanksForSharing {
    return Intl.message(
      'Thanks for sharing',
      name: 'thanksForSharing',
      desc: '',
      args: [],
    );
  }

  /// `The image link is expired or no more exist`
  String get theImageLinkIsExpiredOrNoMoreExist {
    return Intl.message(
      'The image link is expired or no more exist',
      name: 'theImageLinkIsExpiredOrNoMoreExist',
      desc: '',
      args: [],
    );
  }

  /// `Photo downloaded`
  String get photoDownloaded {
    return Intl.message(
      'Photo downloaded',
      name: 'photoDownloaded',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Copy link`
  String get copyLink {
    return Intl.message(
      'Copy link',
      name: 'copyLink',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Color copied`
  String get colorCopied {
    return Intl.message(
      'Color copied',
      name: 'colorCopied',
      desc: '',
      args: [],
    );
  }

  /// `Downloading`
  String get downloading {
    return Intl.message(
      'Downloading',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  /// `Small size`
  String get smallSize {
    return Intl.message(
      'Small size',
      name: 'smallSize',
      desc: '',
      args: [],
    );
  }

  /// `Medium size`
  String get mediumSize {
    return Intl.message(
      'Medium size',
      name: 'mediumSize',
      desc: '',
      args: [],
    );
  }

  /// `Large size`
  String get largeSize {
    return Intl.message(
      'Large size',
      name: 'largeSize',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
