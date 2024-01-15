import 'dart:convert';
import 'package:users/core/error/exception.dart';
import 'package:users/features/users/users.dart';
import 'package:http/http.dart' as http;

class UserHttpClientImpl implements UserHttpClient {
  final http.Client client;

  UserHttpClientImpl({required this.client});

  @override
  Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool isListRequest = false,
  }) async {
    final Map<String, String> defaultHeaders =
        headers?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: defaultHeaders,
      );
      return _handleRespose(response);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> _handleRespose(
    http.Response response,
  ) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonData = jsonDecode(response.body);
      try {
        return usersFromJson(jsonData);
      } catch (e) {
        throw ParsingJsonException();
      }
    }
  }
}
