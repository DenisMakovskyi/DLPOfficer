import 'package:inject/inject.dart';

import 'injector.inject.dart' as g;

import 'package:dlp_officer/main.dart';
import 'package:dlp_officer/di/modules.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

@Injector(const [PreferencesModule, ApiModule, RepositoriesModule])
abstract class Applicator {
  @provide
  Application get app;

  @provide
  AuthRepository getAuthRepository();

  static Future<Applicator> create(
      PreferencesModule preferencesModule,
      ApiModule apiModule,
      RepositoriesModule repositoriesModule) async {
    return await g.Applicator$Injector.create(
        preferencesModule,
        apiModule,
        repositoriesModule);
  }
}
