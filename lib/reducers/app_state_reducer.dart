import 'package:flutter_prinder/models/models.dart';
import 'loading_reducer.dart';
import 'printers_reducer.dart';
import 'preferences_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: loadingReducer(state.isLoading, action),
    mainInitialPage: 1,
    preferences: preferencesReducer(state.preferences, action),
    printers: printersReducer(state.printers, action),
  );
}
