//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaginatedNoteList {
  /// Returns a new [PaginatedNoteList] instance.
  PaginatedNoteList({
    required this.count,
    this.next,
    this.previous,
    this.results = const [],
  });

  int count;

  String? next;

  String? previous;

  List<Note> results;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginatedNoteList &&
    other.count == count &&
    other.next == next &&
    other.previous == previous &&
    _deepEquality.equals(other.results, results);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (count.hashCode) +
    (next == null ? 0 : next!.hashCode) +
    (previous == null ? 0 : previous!.hashCode) +
    (results.hashCode);

  @override
  String toString() => 'PaginatedNoteList[count=$count, next=$next, previous=$previous, results=$results]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'count'] = this.count;
    if (this.next != null) {
      json[r'next'] = this.next;
    } else {
      json[r'next'] = null;
    }
    if (this.previous != null) {
      json[r'previous'] = this.previous;
    } else {
      json[r'previous'] = null;
    }
      json[r'results'] = this.results;
    return json;
  }

  /// Returns a new [PaginatedNoteList] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaginatedNoteList? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'count'), 'Required key "PaginatedNoteList[count]" is missing from JSON.');
        assert(json[r'count'] != null, 'Required key "PaginatedNoteList[count]" has a null value in JSON.');
        assert(json.containsKey(r'results'), 'Required key "PaginatedNoteList[results]" is missing from JSON.');
        assert(json[r'results'] != null, 'Required key "PaginatedNoteList[results]" has a null value in JSON.');
        return true;
      }());

      return PaginatedNoteList(
        count: mapValueOfType<int>(json, r'count')!,
        next: mapValueOfType<String>(json, r'next'),
        previous: mapValueOfType<String>(json, r'previous'),
        results: Note.listFromJson(json[r'results']),
      );
    }
    return null;
  }

  static List<PaginatedNoteList> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaginatedNoteList>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaginatedNoteList.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaginatedNoteList> mapFromJson(dynamic json) {
    final map = <String, PaginatedNoteList>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaginatedNoteList.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaginatedNoteList-objects as value to a dart map
  static Map<String, List<PaginatedNoteList>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaginatedNoteList>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PaginatedNoteList.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'count',
    'results',
  };
}

