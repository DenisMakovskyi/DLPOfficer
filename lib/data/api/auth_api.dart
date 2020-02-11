import 'package:http/http.dart' as http;
import 'package:dlp_officer/data/utils/api_utils.dart';

class AuthApi {
  final http.Client client;

  AuthApi({this.client});

  Future<http.Response> authentication(String username, String password) {
    return client.post(Endpoints.AUTH, headers: <String, String>{
      Headers.KEY_AUTHORIZATION: basicAuth(username, password)
    });
  }
}
