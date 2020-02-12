import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dlp_officer/domain/result.dart';
import 'package:dlp_officer/data/api/response/auth_response.dart';
import 'package:dlp_officer/utils/api_utils.dart';

class AuthApi {
  final http.Client _client;

  AuthApi(this._client);

  Future<ApiResult<AuthenticationResponse>> authentication(String basicAuth) async {
    final response = await _client.post(
        Endpoints.AUTH,
        headers: <String, String>{Headers.KEY_AUTHORIZATION: basicAuth});
    if (response.statusCode == 200) {
      var body = AuthenticationResponse.fromJson(json.decode(response.body));
      return ApiResult(response.statusCode, body);
    } else {
      return ApiResult(response.statusCode, null);
    }
  }
}
