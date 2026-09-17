//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MetaResponse {
  /// Returns a new [MetaResponse] instance.
  MetaResponse({
    required this.message,
    this.errors = const {},
  });

  /// پیام وضعیت عملیات
  String message;

  /// جزئیات خطاها در صورت بروز خطا
  Map<String, Object> errors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MetaResponse &&
    other.message == message &&
    _deepEquality.equals(other.errors, errors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (errors.hashCode);

  @override
  String toString() => 'MetaResponse[message=$message, errors=$errors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'message'] = this.message;
      json[r'errors'] = this.errors;
    return json;
  }

  /// Returns a new [MetaResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MetaResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'message'), 'Required key "MetaResponse[message]" is missing from JSON.');
        assert(json[r'message'] != null, 'Required key "MetaResponse[message]" has a null value in JSON.');
        assert(json.containsKey(r'errors'), 'Required key "MetaResponse[errors]" is missing from JSON.');
        assert(json[r'errors'] != null, 'Required key "MetaResponse[errors]" has a null value in JSON.');
        return true;
      }());

      return MetaResponse(
        message: mapValueOfType<String>(json, r'message')!,
        errors: mapCastOfType<String, Object>(json, r'errors')!,
      );
    }
    return null;
  }

  static List<MetaResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MetaResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MetaResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MetaResponse> mapFromJson(dynamic json) {
    final map = <String, MetaResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MetaResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MetaResponse-objects as value to a dart map
  static Map<String, List<MetaResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MetaResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MetaResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'errors',
  };
}

