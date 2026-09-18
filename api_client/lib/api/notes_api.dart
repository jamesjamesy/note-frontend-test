//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class NotesApi {
  NotesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// ایجاد یادداشت جدید
  ///
  /// یک یادداشت جدید می‌سازد و در صورت احراز هویت، آن را به کاربر متصل می‌کند.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [NoteWrite] noteWrite (required):
  Future<Response> notesCreateCreateWithHttpInfo(NoteWrite noteWrite, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/notes/create';

    // ignore: prefer_final_locals
    Object? postBody = noteWrite;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


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

  /// ایجاد یادداشت جدید
  ///
  /// یک یادداشت جدید می‌سازد و در صورت احراز هویت، آن را به کاربر متصل می‌کند.
  ///
  /// Parameters:
  ///
  /// * [NoteWrite] noteWrite (required):
  Future<NotesCreateCreate201Response?> notesCreateCreate(NoteWrite noteWrite, { Future<void>? abortTrigger, }) async {
    final response = await notesCreateCreateWithHttpInfo(noteWrite, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotesCreateCreate201Response',) as NotesCreateCreate201Response;
    
    }
    return null;
  }

  /// حذف یادداشت
  ///
  /// حذف یادداشت بر اساس شناسه.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> notesDeleteDestroyWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/notes/delete/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// حذف یادداشت
  ///
  /// حذف یادداشت بر اساس شناسه.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<void> notesDeleteDestroy(int id, { Future<void>? abortTrigger, }) async {
    final response = await notesDeleteDestroyWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// جزئیات یادداشت
  ///
  /// دریافت اطلاعات کامل یک یادداشت بر اساس شناسه.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> notesDetailRetrieveWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/notes/detail/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// جزئیات یادداشت
  ///
  /// دریافت اطلاعات کامل یک یادداشت بر اساس شناسه.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<NotesCreateCreate201Response?> notesDetailRetrieve(int id, { Future<void>? abortTrigger, }) async {
    final response = await notesDetailRetrieveWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotesCreateCreate201Response',) as NotesCreateCreate201Response;
    
    }
    return null;
  }

  /// لیست یادداشت‌ها
  ///
  /// دریافت لیست یادداشت‌های کاربر یا یادداشت‌های عمومی به صورت صفحه‌بندی‌شده.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   A page number within the paginated result set.
  Future<Response> notesListListWithHttpInfo({ int? page, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/notes/list';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// لیست یادداشت‌ها
  ///
  /// دریافت لیست یادداشت‌های کاربر یا یادداشت‌های عمومی به صورت صفحه‌بندی‌شده.
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   A page number within the paginated result set.
  Future<NotesListList200Response?> notesListList({ int? page, Future<void>? abortTrigger, }) async {
    final response = await notesListListWithHttpInfo(page: page, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotesListList200Response',) as NotesListList200Response;
    
    }
    return null;
  }

  /// ویرایش جزئی یادداشت
  ///
  /// ویرایش بخشی از اطلاعات یادداشت.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [PatchedNoteWrite] patchedNoteWrite:
  Future<Response> notesUpdatePartialUpdateWithHttpInfo(int id, { PatchedNoteWrite? patchedNoteWrite, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/notes/update/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = patchedNoteWrite;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// ویرایش جزئی یادداشت
  ///
  /// ویرایش بخشی از اطلاعات یادداشت.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [PatchedNoteWrite] patchedNoteWrite:
  Future<NotesCreateCreate201Response?> notesUpdatePartialUpdate(int id, { PatchedNoteWrite? patchedNoteWrite, Future<void>? abortTrigger, }) async {
    final response = await notesUpdatePartialUpdateWithHttpInfo(id, patchedNoteWrite: patchedNoteWrite, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotesCreateCreate201Response',) as NotesCreateCreate201Response;
    
    }
    return null;
  }

  /// ویرایش یادداشت
  ///
  /// ویرایش کامل عنوان، محتوا یا دسته‌بندی یادداشت.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [NoteWrite] noteWrite (required):
  Future<Response> notesUpdateUpdateWithHttpInfo(int id, NoteWrite noteWrite, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/notes/update/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = noteWrite;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// ویرایش یادداشت
  ///
  /// ویرایش کامل عنوان، محتوا یا دسته‌بندی یادداشت.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [NoteWrite] noteWrite (required):
  Future<NotesCreateCreate201Response?> notesUpdateUpdate(int id, NoteWrite noteWrite, { Future<void>? abortTrigger, }) async {
    final response = await notesUpdateUpdateWithHttpInfo(id, noteWrite, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotesCreateCreate201Response',) as NotesCreateCreate201Response;
    
    }
    return null;
  }
}
