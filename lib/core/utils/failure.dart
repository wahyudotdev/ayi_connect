import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String getError();
}

class ServerFailure extends Failure {
  final String? message;
  ServerFailure({this.message});

  @override
  List<Object?> get props => [message];

  @override
  String getError() {
    return message ?? 'server failure';
  }
}

class CacheFailure extends Failure {
  final String? message;
  CacheFailure({this.message});

  @override
  List<Object?> get props => [message];
  @override
  String getError() {
    return message ?? 'cache failure';
  }
}

class NetworkFailure extends Failure {
  final String? message;
  NetworkFailure({this.message});

  @override
  List<Object?> get props => [message];
  @override
  String getError() {
    return message ?? 'connection failure';
  }
}

class UserRegisterFailure extends Failure {
  final String? message;
  UserRegisterFailure({this.message});

  @override
  List<Object?> get props => [message];
  @override
  String getError() {
    return message ?? 'registration fail';
  }
}

class UserLoginFailure extends Failure {
  final String? message;
  UserLoginFailure({this.message});

  @override
  List<Object?> get props => [message];
  @override
  String getError() {
    return message ?? 'login fail';
  }
}

class UserUpdateFailure extends Failure {
  final String? message;
  UserUpdateFailure({this.message});

  @override
  List<Object?> get props => [message];
  @override
  String getError() {
    return message ?? 'user update fail';
  }
}

class UserNotFoundFailure extends Failure {
  final String? message;
  UserNotFoundFailure({this.message});

  @override
  List<Object?> get props => [message];
  @override
  String getError() {
    return message ?? 'user not found fail';
  }
}
