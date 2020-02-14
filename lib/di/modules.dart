import 'package:inject/inject.dart';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'package:dlp_officer/data/api/auth_api.dart';
import 'package:dlp_officer/data/api/api_client_interceptor.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';
import 'package:dlp_officer/domain/repositories/auth_repository.dart';

@module
class PreferencesModule {
  @provide
  AuthPreferences provideAuthPreferences() {
    return AuthPreferences();
  }
}

@module
class ApiModule {
  @provide
  AuthInterceptor provideAuthInterceptor(AuthPreferences authPreferences) {
    return AuthInterceptor(authPreferences);
  }

  @provide
  http.Client provideHttpClient(AuthInterceptor authInterceptor) {
    return HttpClientWithInterceptor.build(
        interceptors: [authInterceptor], requestTimeout: Duration(seconds: 30));
  }

  @provide
  AuthApi provideAuthApi(http.Client client) {
    return AuthApi(client);
  }
}

@module
class RepositoriesModule {
  @provide
  AuthRepository provideAuthRepository(
      AuthApi authApi, AuthPreferences authPreferences) {
    return AuthRepositoryImpl(authApi, authPreferences);
  }
}
