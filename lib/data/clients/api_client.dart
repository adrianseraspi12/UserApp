
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/data/app_config.dart';
import 'package:user_app/data/clients/user_client.dart';

class ApiClient extends UserClient {

  @override
  Future<Response> getUsers() {
    return http.get(AppConfig.userUrlPath);
  }

}