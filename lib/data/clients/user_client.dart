import 'package:http/http.dart';

abstract class UserClient {
  Future<Response> getUsers();
}
