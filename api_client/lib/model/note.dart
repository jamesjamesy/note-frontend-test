//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Note {
  /// Returns a new [Note] instance.
  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  int id;

  String title;

  String content;

  DateTime createdAt;

  DateTime updatedAt;

  Category? category;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Note &&
    other.id == id &&
    other.title == title &&
    other.content == content &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt &&
    other.category == category;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (title.hashCode) +
    (content.hashCode) +
    (createdAt.hashCode) +
    (updatedAt.hashCode) +
    (category == null ? 0 : category!.hashCode);

  @override
  String toString() => 'Note[id=$id, title=$title, content=$content, createdAt=$createdAt, updatedAt=$updatedAt, category=$category]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'title'] = this.title;
      json[r'content'] = this.content;
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
    }
    return json;
  }

  /// Returns a new [Note] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Note? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Note[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Note[id]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "Note[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "Note[title]" has a null value in JSON.');
        assert(json.containsKey(r'content'), 'Required key "Note[content]" is missing from JSON.');
        assert(json[r'content'] != null, 'Required key "Note[content]" has a null value in JSON.');
        assert(json.containsKey(r'created_at'), 'Required key "Note[created_at]" is missing from JSON.');
        assert(json[r'created_at'] != null, 'Required key "Note[created_at]" has a null value in JSON.');
        assert(json.containsKey(r'updated_at'), 'Required key "Note[updated_at]" is missing from JSON.');
        assert(json[r'updated_at'] != null, 'Required key "Note[updated_at]" has a null value in JSON.');
        assert(json.containsKey(r'category'), 'Required key "Note[category]" is missing from JSON.');
        return true;
      }());

      return Note(
        id: mapValueOfType<int>(json, r'id')!,
        title: mapValueOfType<String>(json, r'title')!,
        content: mapValueOfType<String>(json, r'content')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        category: Category.fromJson(json[r'category']),
      );
    }
    return null;
  }

  static List<Note> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Note>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Note.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Note> mapFromJson(dynamic json) {
    final map = <String, Note>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Note.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Note-objects as value to a dart map
  static Map<String, List<Note>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Note>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Note.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'title',
    'content',
    'created_at',
    'updated_at',
    'category',
  };
}

