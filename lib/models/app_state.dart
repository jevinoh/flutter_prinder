import 'package:meta/meta.dart';
import 'package:flutter_prinder/models/models.dart';

@immutable
class AppState {
  AppState({
    this.isLoading: false,
    this.mainInitialPage,
    User user,
    Strangers strangers,
  }) :
       this.user = user ?? new User.loading(),
       this.strangers = strangers ?? new Strangers.loading();

  factory AppState.loading() => new AppState(isLoading: true);

  final bool isLoading;
  final int mainInitialPage;
  final User user;
  final Strangers strangers;

  AppState copyWith({
    bool isLoading,
    int mainInitialPage,
    User user,
    Strangers strangers,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      mainInitialPage: mainInitialPage ?? this.mainInitialPage,
      user: user ?? this.user,
      strangers: strangers,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    mainInitialPage.hashCode ^
    user.hashCode ^
    strangers.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    mainInitialPage == other.mainInitialPage &&
    user == other.user &&
    strangers == other.strangers;

  @override
  String toString() =>
    'AppState{isLoading: $isLoading, mainInitialPage: $mainInitialPage, strangers: $strangers}';
}
