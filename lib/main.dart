import 'package:inject/inject.dart';
import 'package:flutter/material.dart';

import 'package:dlp_officer/di/injector.dart';
import 'package:dlp_officer/di/modules.dart';

void mainDelegate() async {
  var applicator = await Applicator.create(
      PreferencesModule(),
      ApiModule(),
      RepositoriesModule());
  runApp(applicator.app);
}

@provide
class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
