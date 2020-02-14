import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:dlp_officer/l10n/intl_messages_all.dart';

class Strings {
  static Future<Strings> load(Locale locale) {
    final name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((value) {
      Intl.defaultLocale = localeName;
      return new Strings();
    });
  }

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  String get authUsername {
    return Intl.message('Username', name: 'authUsername');
  }

  String get authPassword {
    return Intl.message('Password', name: 'authPassword');
  }

  String get authSignIn {
    return Intl.message('Sign in', name: 'authSignIn');
  }

  String get authSigningIn {
    return Intl.message('Signing in...', name: 'authSigningIn');
  }

  String get dialogActionClose {
    return Intl.message('Close', name: 'dialogActionClose');
  }

  String get error {
    return Intl.message('Error', name: 'error');
  }

  String requestError(int code) {
    return Intl.message('Request error occurred. Response code: $code',
        name: 'requestError',
        args: [code],
        desc: 'Http status code',
        examples: {'code': 400});
  }
}

class StringsDelegate extends LocalizationsDelegate<Strings> {
  const StringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'uk', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<Strings> load(Locale locale) {
    return Strings.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;
}
