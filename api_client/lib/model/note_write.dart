//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NoteWrite {
  /// Returns a new [NoteWrite] instance.
  NoteWrite({
    required this.title,
    required this.content,
    this.category,
  });

  String title;

  String content;

  int? category;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NoteWrite &&
    other.title == title &&
    other.content == content &&
    other.category == category;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (title.hashCode) +
    (content.hashCode) +
    (category == null ? 0 : category!.hashCode);

  @override
  String toString() => 'NoteWrite[title=$title, content=$content, category=$category]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'title'] = this.title;
      json[r'content'] = this.content;
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
    }
    return json;
  }

  /// Returns a new [NoteWrite] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NoteWrite? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'title'), 'Required key "NoteWrite[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "NoteWrite[title]" has a null value in JSON.');
        assert(json.containsKey(r'content'), 'Required key "NoteWrite[content]" is missing from JSON.');
        assert(json[r'content'] != null, 'Required key "NoteWrite[content]" has a null value in JSON.');
        return true;
      }());

      return NoteWrite(
        title: mapValueOfType<String>(json, r'title')!,
        content: mapValueOfType<String>(json, r'content')!,
        category: mapValueOfType<int>(json, r'category'),
      );
    }
    return null;
  }

  static List<NoteWrite> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NoteWrite>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NoteWrite.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NoteWrite> mapFromJson(dynamic json) {
    final map = <String, NoteWrite>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NoteWrite.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NoteWrite-objects as value to a dart map
  static Map<String, List<NoteWrite>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NoteWrite>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NoteWrite.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'title',
    'content',
  };
}

