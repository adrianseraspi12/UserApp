import 'package:user_app/data/models/user.dart';
import 'package:user_app/data/result.dart';
import 'package:user_app/data/services/user_service.dart';
import 'package:user_app/ui/screens/user_view_model_contract.dart';

class UserViewModel extends UserViewModelContract {
  UserViewModel({required this.userService});

  final UserService userService;

  @override
  void fetchUsers(Function(List<User> p1) onSuccess, Function(String p1) onFailed) async {
    var result = await userService.getUsers();

    if (result is Success) {
      onSuccess(result.data);
    } else {
      var error = result as Failed;
      onFailed(error.errorMessage);
    }
  }
}
