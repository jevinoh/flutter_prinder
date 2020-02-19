import 'package:meta/meta.dart';
import 'package:flutter_prinder/models/models.dart';

@immutable
class AppState {
  AppState({
    this.isLoading: false,
    this.mainInitialPage,
    User user,
    Printers printers,
  }) :
       this.user = user ?? new User.loading(),
       this.printers = printers ?? new Printers.loading();

  factory AppState.loading() => new AppState(isLoading: true);

  final bool isLoading;
  final int mainInitialPage;
  final User user;
  final Printers printers;

  AppState copyWith({
    bool isLoading,
    int mainInitialPage,
    User user,
    Printers printers,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      mainInitialPage: mainInitialPage ?? this.mainInitialPage,
      user: user ?? this.user,
      printers: printers,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    mainInitialPage.hashCode ^
    user.hashCode ^
    printers.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    mainInitialPage == other.mainInitialPage &&
    user == other.user &&
    printers == other.printers;

  @override
  String toString() =>
    'AppState{isLoading: $isLoading, mainInitialPage: $mainInitialPage, printers: $printers}';
}
