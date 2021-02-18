import 'dart:convert';
import 'package:money_manager/models/jwt.dart';

class JWTService {
  static String getUserName(String token) {
    return readJWT(token).uniqueName;
  }

  static JWT readJWT(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final normalizedPayload = base64Url.normalize(parts[1]);
    final payload = utf8.decode(base64Url.decode(normalizedPayload));
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return JWT.fromJson(payloadMap);
  }
}