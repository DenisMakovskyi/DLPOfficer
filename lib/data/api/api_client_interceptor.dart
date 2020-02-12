import 'package:inject/inject.dart';

import 'package:http_interceptor/http_interceptor.dart';

import 'package:dlp_officer/env.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';
import 'package:dlp_officer/utils/api_utils.dart';
import 'package:dlp_officer/utils/string_utils.dart';

class AuthInterceptor implements InterceptorContract {
  final AuthPreferences _authPreferences;

  @provide
  AuthInterceptor(this._authPreferences);

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    data.headers[Headers.KEY_ACCEPT] = Headers.VALUE_APPLICATION_JSON;
    data.headers[Headers.KEY_CONTENT_TYPE] = Headers.VALUE_APPLICATION_JSON;
    data.headers[Headers.KEY_APPLICATION_ID] = Constants.APP_ID;
    if (isNullOrEmpty(data.headers[Headers.KEY_AUTHORIZATION])) {
      var basicAuth = await _authPreferences.getBasicAuth();
      if (isNonNullOrEmpty(basicAuth)) {
        data.headers[Headers.KEY_AUTHORIZATION] = basicAuth;
      }
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}
