import 'package:inject/inject.dart';

import 'injector.inject.dart' as g;

import 'package:dlp_officer/di/modules.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

@Injector(const [PreferencesModule, ApiModule, RepositoriesModule])
abstract class AppComponent {
  @provide
  AuthPreferences getAuthPreferences();

  @provide
  AuthRepository getAuthRepository();

  static Future<AppComponent> create(PreferencesModule preferencesModule,
      ApiModule apiModule, RepositoriesModule repositoriesModule) async {
    return await g.AppComponent$Injector.create(
        preferencesModule, apiModule, repositoriesModule);
  }
}
