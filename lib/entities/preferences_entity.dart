import 'package:meta/meta.dart';

@immutable
class PreferenceEntity {
  PreferenceEntity({
    this.paperSize: 'False',
    this.color: 'False',
    this.mfp: 'False',
    this.location: 'Invalid',
  });

  factory PreferenceEntity.fromJson(Map<String, dynamic> data) {


    return new PreferenceEntity(
      paperSize: data['paperSize'] as String,
      color: data['color'] as String,
      mfp: data['mfp'] as String,
      location: data['location'] as String,
    );
  }

  final String paperSize;
  final String color;
  final String mfp;
  final String location;

  PreferenceEntity copyWith({
    String paperSize,
    String color,
    String mfp,
    String location,
  }) {
    return new PreferenceEntity(
      paperSize: paperSize ?? this.paperSize,
      color: color ?? this.color,
      mfp: mfp ?? this.mfp,
      location: location ?? this.location,
    );
  }

  Map<String, Object> toJson() {
    return {
      'paperSize': paperSize,
      'color': color,
      'mfp': mfp,
      'location': location,
    };
  }

  @override
  String toString() {
    return 'PreferenceEntity{paperSize: $paperSize, color: $color, mfp: $mfp, location: $location}';
  }

  @override
  int get hashCode =>
      paperSize.hashCode ^
    color.hashCode ^
    mfp.hashCode ^
    location.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    paperSize == other.paperSize &&
    color == other.color &&
    mfp == other.name &&
    location == other.location;
}
