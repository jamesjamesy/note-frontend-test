//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotesListList200Response {
  /// Returns a new [NotesListList200Response] instance.
  NotesListList200Response({
    required this.meta,
    required this.data,
  });

  MetaResponse meta;

  PaginatedNoteList data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotesListList200Response &&
    other.meta == meta &&
    other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (meta.hashCode) +
    (data.hashCode);

  @override
  String toString() => 'NotesListList200Response[meta=$meta, data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'meta'] = this.meta;
      json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [NotesListList200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotesListList200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'meta'), 'Required key "NotesListList200Response[meta]" is missing from JSON.');
        assert(json[r'meta'] != null, 'Required key "NotesListList200Response[meta]" has a null value in JSON.');
        assert(json.containsKey(r'data'), 'Required key "NotesListList200Response[data]" is missing from JSON.');
        assert(json[r'data'] != null, 'Required key "NotesListList200Response[data]" has a null value in JSON.');
        return true;
      }());

      return NotesListList200Response(
        meta: MetaResponse.fromJson(json[r'meta'])!,
        data: PaginatedNoteList.fromJson(json[r'data'])!,
      );
    }
    return null;
  }

  static List<NotesListList200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotesListList200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotesListList200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotesListList200Response> mapFromJson(dynamic json) {
    final map = <String, NotesListList200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotesListList200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotesListList200Response-objects as value to a dart map
  static Map<String, List<NotesListList200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotesListList200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotesListList200Response.listFromJson(entry.value, growable: growable,);
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

