import 'package:inject/inject.dart';

import 'package:dlp_officer/domain/result.dart';
import 'package:dlp_officer/data/api/auth_api.dart';
import 'package:dlp_officer/data/api/response/auth_response.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';
import 'package:dlp_officer/data/utils/api_utils.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthenticationResponse>> authenticate(String username, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final AuthPreferences authPreferences;

  @provide
  AuthRepositoryImpl(this.authApi, this.authPreferences);

  @override
  Future<ApiResult<AuthenticationResponse>> authenticate(String username, String password) async {
    var basic = basicAuth(username, password);
    var result = await authApi.authentication(basic);
    if (result.isSuccess()) {
      authPreferences.setBasicAuth(basic);
    }
    return result;
  }
}
