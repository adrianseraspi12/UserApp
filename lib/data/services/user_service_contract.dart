
import 'package:user_app/data/result.dart';

abstract class UserServiceContract {

  Future<Result> getUsers();

}