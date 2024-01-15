import 'package:users/core/core.dart';
import 'package:users/features/users/users.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserHttpClient httpClient;

  UserRemoteDataSourceImpl({required this.httpClient});
  final baseUrl = ApiUrls.baseUrl;
  @override
  Future<List<User>> getUsers() async {
    final url = '$baseUrl/users';
    final response = await httpClient.request(
      url: url,
    );
    return response;
  }
}
