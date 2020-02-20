import 'package:redux/redux.dart';
import 'package:flutter_prinder/actions/actions.dart';
import 'package:flutter_prinder/models/models.dart';

final preferencesReducer = combineReducers<Preferences>([
  new TypedReducer<Preferences, LoadPreferencesAction>(_loadPreferencesReducer),
  new TypedReducer<Preferences, LoadPreferencesSuccessAction>(_loadPreferencesSuccessReducer),
]);

Preferences _loadPreferencesReducer(Preferences state, LoadPreferencesAction action) =>
  new Preferences.loading();

Preferences _loadPreferencesSuccessReducer(Preferences state, LoadPreferencesSuccessAction action) {
  return new Preferences(
    isLoading: false,
    preferences: action.preference,
  );
}
