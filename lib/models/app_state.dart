import 'package:meta/meta.dart';
import 'package:flutter_prinder/models/models.dart';

@immutable
class AppState {
  AppState({
    this.isLoading: false,
    this.mainInitialPage,
    User user,
    Preferences preferences,
    Printers printers,
  }) :
       this.user = user ?? new User.loading(),
       this.preferences = preferences ?? new Preferences.loading(),
       this.printers = printers ?? new Printers.loading();

  factory AppState.loading() => new AppState(isLoading: true);

  final bool isLoading;
  final int mainInitialPage;
  final User user;
  final Preferences preferences;
  final Printers printers;

  AppState copyWith({
    bool isLoading,
    int mainInitialPage,
    User user,
    Preferences preferences,
    Printers printers,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      mainInitialPage: mainInitialPage ?? this.mainInitialPage,
      user: user ?? this.user,
      preferences: preferences,
      printers: printers,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    mainInitialPage.hashCode ^
    user.hashCode ^
    preferences.hashCode ^
    printers.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    mainInitialPage == other.mainInitialPage &&
    user == other.user &&
    preferences == other.preferences &&
    printers == other.printers;

  @override
  String toString() =>
    'AppState{isLoading: $isLoading, mainInitialPage: $mainInitialPage, preferences : $preferences, printers: $printers}';
}
