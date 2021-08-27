import 'package:equatable/equatable.dart';

abstract class Result extends Equatable {
  @override
  List<Object?> get props => [];
}

class Success<T> extends Result {
  Success(this.data);

  final T data;

  @override
  List<Object?> get props => [this.data];
}

class Failed extends Result {
  Failed(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [this.errorMessage];
}
