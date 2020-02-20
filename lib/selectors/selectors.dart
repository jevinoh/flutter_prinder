import 'package:redux/redux.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/utils/formatters.dart';

AppState stateSelector(Store<AppState> store) => store.state;

int mainInitialPageSelector(Store<AppState> store) =>
  stateSelector(store).mainInitialPage;

User userSelector(Store<AppState> store) => stateSelector(store).user;

String userPresentationNameSelector(Store<AppState> store) =>
  makePresentationName(stateSelector(store).user.user);

int userSelectedImageIndexSelector(Store<AppState> store) =>
  userSelector(store).selectedImageIndex;

List<String> userImagesSelector(Store<AppState> store) =>
  userSelector(store).user.images;

String userSelectedImageUrlSelector(Store<AppState> store) {
  List<String> images = userImagesSelector(store);
  if (images.length > 0)
    return images[userSelectedImageIndexSelector(store)];
  return '';
}

String userFirstImageUrlSelector(Store<AppState> store) {
  List<String> images = userImagesSelector(store);
  if (images.length > 0)
    return images[0];
  return '';
}

//Strangers strangersSelector(Store<AppState> store) => stateSelector(store).strangers;

//bool hasStrangersSelector(Store<AppState> store) => strangersSelector(store).strangers.length > 0;

Printers printersSelector(Store<AppState> store) => stateSelector(store).printers;

bool hasPrintersSelector(Store<AppState> store) => printersSelector(store).printers.length > 0;

Preferences preferenceSelector(Store<AppState> store) => stateSelector(store).preferences;

bool hasPreferencesSelector(Store<AppState> store) => preferenceSelector(store).preferences.length > 0;
