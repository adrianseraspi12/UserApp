import 'dart:convert';

import 'package:user_app/data/clients/user_client.dart';
import 'package:user_app/data/models/user.dart';
import 'package:user_app/data/result.dart';
import 'package:user_app/data/services/user_service_contract.dart';

class UserService extends UserServiceContract {
  UserService(this.userClient);

  final UserClient userClient;

  @override
  Future<Result> getUsers() async {
    try {
      final response = await userClient.getUsers();

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        // Decode json and return the data
        var json = jsonDecode(response.body) as List;
        List<User> listOfUser = json.map((e) => User.fromJson(e)).toSet().toList();
        return Success(listOfUser);
      }

      return Failed('Unable to get the chapter. Please try again');
    } catch (e) {
      return Failed('Unable to get the user. Please try again');
    }
  }
}
