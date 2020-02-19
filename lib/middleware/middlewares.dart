import 'package:flutter_prinder/actions/preferences.dart';
import 'package:redux/redux.dart';

import 'package:flutter_prinder/actions/actions.dart';
import 'package:flutter_prinder/entities/entities.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/services/services.dart';

List<Middleware<AppState>> createAllMiddlewares() {
  return [
    TypedMiddleware<AppState, LoadAppAction>(_initalizeApp),
    TypedMiddleware<AppState, LoadPreferencesAction>(_loadPreference),
//    TypedMiddleware<AppState, LoadUserAction>(_loadCurrentUser),
    TypedMiddleware<AppState, LoadPrintersAction>(_loadPrinters),
  ];
}

void _initalizeApp(Store<AppState> store, action, NextDispatcher next) {
  next(action);
  next(new LoadPreferencesAction());
  next(new LoadPrintersAction());
}

void _loadCurrentUser(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  try {
    UserEntity user =  await UsersService.loadCurrentUser();

//    store.dispatch(new LoadStrangersAction());
    store.dispatch(new LoadPrintersAction());
    store.dispatch(new LoadUserSuccessAction(user));
  } catch (error) {
    store.dispatch(new LoadUserFailAction(error.message));
  }
}

void _loadMatchs(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  try {
    List<UserEntity> users = await UsersService.loadMatchs();

    store.dispatch(new LoadMatchsSuccessAction(users));
  } catch (error) {
    store.dispatch(new LoadMatchsFailAction(error.message));
  }
}

void _loadPreference(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  try {

    List<PreferenceEntity> preference = UsersService.loadPrefences();
    store.dispatch(new LoadPreferencesSuccessAction(preference));

  } catch (error) {
    store.dispatch(new LoadPreferencesFailAction(error.message));
  }
}


void _loadPrinters(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  try {
    List<PrinterEntity> printers = await UsersService.loadPrinters();

    store.dispatch(new LoadPrintersSuccessAction(printers));
  } catch (error) {
    store.dispatch(new LoadPrintersFailAction(error.message));
  }
}
