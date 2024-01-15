import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:users/features/users/users.dart';

final httpClientProvider = Provider.autoDispose<UserHttpClient>((ref) {
  final client = http.Client();
  return UserHttpClientImpl(client: client);
});
