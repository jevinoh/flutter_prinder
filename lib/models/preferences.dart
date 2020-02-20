import 'package:flutter/foundation.dart';
import 'package:flutter_prinder/entities/entities.dart';

@immutable
class Preferences {
  Preferences({
    this.isLoading: false,
    this.preferences: const [],
  });

  factory Preferences.loading() => new Preferences(isLoading: true);

  final bool isLoading;
  final List<PreferenceEntity> preferences;

  Preferences copyWith({
    bool isLoading,
    List<PreferenceEntity> preferences,
  }) {
    return new Preferences(isLoading: isLoading ?? this.isLoading, preferences: preferences ?? this.preferences,);
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    preferences.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    preferences == other.strangers;

  @override
  String toString() =>
    'Strangers{isLoading: $isLoading, preferences: $preferences}';
}
