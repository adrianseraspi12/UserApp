
import 'package:user_app/data/models/user.dart';

abstract class UserViewModelContract {

  void fetchUsers(Function(List<User>) onSuccess, Function(String) onFailed);

}