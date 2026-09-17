//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CategoriesRetrieve200Response {
  /// Returns a new [CategoriesRetrieve200Response] instance.
  CategoriesRetrieve200Response({
    required this.meta,
    required this.data,
  });

  MetaResponse meta;

  Category data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CategoriesRetrieve200Response &&
    other.meta == meta &&
    other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (meta.hashCode) +
    (data.hashCode);

  @override
  String toString() => 'CategoriesRetrieve200Response[meta=$meta, data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'meta'] = this.meta;
      json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [CategoriesRetrieve200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CategoriesRetrieve200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'meta'), 'Required key "CategoriesRetrieve200Response[meta]" is missing from JSON.');
        assert(json[r'meta'] != null, 'Required key "CategoriesRetrieve200Response[meta]" has a null value in JSON.');
        assert(json.containsKey(r'data'), 'Required key "CategoriesRetrieve200Response[data]" is missing from JSON.');
        assert(json[r'data'] != null, 'Required key "CategoriesRetrieve200Response[data]" has a null value in JSON.');
        return true;
      }());

      return CategoriesRetrieve200Response(
        meta: MetaResponse.fromJson(json[r'meta'])!,
        data: Category.fromJson(json[r'data'])!,
      );
    }
    return null;
  }

  static List<CategoriesRetrieve200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CategoriesRetrieve200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CategoriesRetrieve200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CategoriesRetrieve200Response> mapFromJson(dynamic json) {
    final map = <String, CategoriesRetrieve200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CategoriesRetrieve200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CategoriesRetrieve200Response-objects as value to a dart map
  static Map<String, List<CategoriesRetrieve200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CategoriesRetrieve200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CategoriesRetrieve200Response.listFromJson(entry.value, growable: growable,);
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

