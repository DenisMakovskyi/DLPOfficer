import 'package:inject/inject.dart';

import 'package:dlp_officer/domain/result.dart';
import 'package:dlp_officer/data/api/auth_api.dart';
import 'package:dlp_officer/data/api/response/auth_response.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';
import 'package:dlp_officer/utils/api_utils.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthenticationResponse>> authenticate(String username, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final AuthPreferences _authPreferences;

  @provide
  AuthRepositoryImpl(this._authApi, this._authPreferences);

  @override
  Future<ApiResult<AuthenticationResponse>> authenticate(String username, String password) async {
    var basic = basicAuth(username, password);
    var result = await _authApi.authentication(basic);
    if (result.isSuccess()) {
      _authPreferences.setBasicAuth(basic);
    }
    return result;
  }
}
