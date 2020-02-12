import 'dart:convert';

import 'package:dlp_officer/env.dart';

class Headers {
  static const String KEY_ACCEPT = "Accept";
  static const String KEY_CONTENT_TYPE = "Content-Type";
  static const String KEY_AUTHORIZATION = "Authorization";
  static const String KEY_APPLICATION_ID = "X-APPLICATION-ID";

  static const String VALUE_APPLICATION_JSON = "application/json";
}

class Endpoints {
  static const String API = "api/";
  static const String V1 = "v1/";
  static const String STAFF = "staff_member/";

  static get AUTH => Constants.HOST_URL + API + V1 + STAFF + "auth/";
}

String basicAuth(String username, String password) {
  return "Basic" + base64.encode(utf8.encode("$username:$password"));
}
