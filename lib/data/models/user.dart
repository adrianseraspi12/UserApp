import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String imageUrl;

  User(this.id, this.name, this.imageUrl);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'];

  @override
  List<Object?> get props => [id, name, imageUrl];
}
