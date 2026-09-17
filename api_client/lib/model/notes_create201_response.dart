//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotesCreate201Response {
  /// Returns a new [NotesCreate201Response] instance.
  NotesCreate201Response({
    required this.meta,
    required this.data,
  });

  MetaResponse meta;

  NoteWrite data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotesCreate201Response &&
    other.meta == meta &&
    other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (meta.hashCode) +
    (data.hashCode);

  @override
  String toString() => 'NotesCreate201Response[meta=$meta, data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'meta'] = this.meta;
      json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [NotesCreate201Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotesCreate201Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'meta'), 'Required key "NotesCreate201Response[meta]" is missing from JSON.');
        assert(json[r'meta'] != null, 'Required key "NotesCreate201Response[meta]" has a null value in JSON.');
        assert(json.containsKey(r'data'), 'Required key "NotesCreate201Response[data]" is missing from JSON.');
        assert(json[r'data'] != null, 'Required key "NotesCreate201Response[data]" has a null value in JSON.');
        return true;
      }());

      return NotesCreate201Response(
        meta: MetaResponse.fromJson(json[r'meta'])!,
        data: NoteWrite.fromJson(json[r'data'])!,
      );
    }
    return null;
  }

  static List<NotesCreate201Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotesCreate201Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotesCreate201Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotesCreate201Response> mapFromJson(dynamic json) {
    final map = <String, NotesCreate201Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotesCreate201Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotesCreate201Response-objects as value to a dart map
  static Map<String, List<NotesCreate201Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotesCreate201Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotesCreate201Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'meta',
    'data',
  };
}

