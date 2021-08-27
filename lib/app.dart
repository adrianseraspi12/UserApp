import 'package:user_app/data/clients/api_client.dart';
import 'package:user_app/data/services/user_service.dart';

class App {
  static UserService provideUserService() {
    return UserService(ApiClient());
  }
}
