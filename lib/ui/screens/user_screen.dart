import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/data/models/user.dart';
import 'package:user_app/ui/screens/user_view_model_contract.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, required this.viewModel}) : super(key: key);

  final UserViewModelContract viewModel;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  List<User> datasource = [];

  @override
  void initState() {
    super.initState();
    this.widget
        .viewModel
        .fetchUsers(_userCallback(), _errorCallback());
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: Text("USER LIST"),
        ),
      body: _buildList(),
    );
  }

  Function(List<User>) _userCallback() => (users) {
    setState(() {
      this.datasource = users;
    });
  };

  Function(String) _errorCallback() => (error) {
    Fluttertoast.showToast(msg: error);
  };

  Widget _buildList() {
    if (datasource.isEmpty) return Container(child: Text('No available users'));

    return Container(
      child: ListView.builder(
        itemCount: datasource.length,
          itemBuilder: (context, index) {
          User user = datasource[index];
          return ListTile(
            leading: Image.network(user.imageUrl),
            title: Text(user.name),
          );
      })
    );
  }
}