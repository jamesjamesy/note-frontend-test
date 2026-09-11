//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LoginApi {
  LoginApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/login/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] username (required):
  ///
  /// * [String] password (required):
  ///
  /// * [String] token (required):
  Future<Response> loginCreateWithHttpInfo(String username, String password, String token, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/login/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded', 'multipart/form-data', 'application/json'];

    if (username != null) {
      formParams[r'username'] = parameterToString(username);
    }
    if (password != null) {
      formParams[r'password'] = parameterToString(password);
    }
    if (token != null) {
      formParams[r'token'] = parameterToString(token);
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Parameters:
  ///
  /// * [String] username (required):
  ///
  /// * [String] password (required):
  ///
  /// * [String] token (required):
  Future<AuthToken?> loginCreate(String username, String password, String token, { Future<void>? abortTrigger, }) async {
    final response = await loginCreateWithHttpInfo(username, password, token, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthToken',) as AuthToken;
    
    }
    return null;
  }
}
