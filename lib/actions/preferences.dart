import 'package:flutter_prinder/entities/entities.dart';

class LoadPreferencesAction {}

class LoadPreferencesSuccessAction {
  final List<PreferenceEntity> preference;

  LoadPreferencesSuccessAction(this.preference);

  @override
  String toString() =>
    'LoadPreferencesSuccessAction{strangers: $preference}';
}

class LoadPreferencesFailAction {
  final String message;

  LoadPreferencesFailAction(this.message);

  @override
  String toString() =>
    'LoadPreferencesFailAction{message: $message}';
}
