import 'package:http_interceptor/http_interceptor.dart';
import 'package:dlp_officer/data/preferences/preferences.dart';
import 'package:dlp_officer/data/utils/api_utils.dart';
import 'package:dlp_officer/data/utils/string_utils.dart';

class AuthInterceptor implements InterceptorContract {
  final AuthPreferences authPreferences;

  AuthInterceptor(this.authPreferences);

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    data.headers[Headers.KEY_ACCEPT] = Headers.VALUE_APPLICATION_JSON;
    data.headers[Headers.KEY_CONTENT_TYPE] = Headers.VALUE_APPLICATION_JSON;
    var basicAuth = await authPreferences.getBasicAuth();
    if (isNonNullOrEmpty(basicAuth)) {
      data.headers[Headers.KEY_AUTHORIZATION] = basicAuth;
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}
