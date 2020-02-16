import 'package:flutter_prinder/entities/entities.dart';

class LoadStrangersAction {}

class LoadStrangersSuccessAction {
  final List<UserEntity> strangers;

  LoadStrangersSuccessAction(this.strangers);

  @override
  String toString() =>
    'LoadStrangersSuccessAction{strangers: $strangers}';
}

class LoadStrangersFailAction {
  final String message;

  LoadStrangersFailAction(this.message);

  @override
  String toString() =>
    'LoadStrangersFailAction{message: $message}';
}
