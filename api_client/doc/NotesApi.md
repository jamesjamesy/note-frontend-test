# openapi.api.NotesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notesCreateCreate**](NotesApi.md#notescreatecreate) | **POST** /api/notes/create | ایجاد یادداشت جدید
[**notesDeleteDestroy**](NotesApi.md#notesdeletedestroy) | **DELETE** /api/notes/delete/{id} | حذف یادداشت
[**notesDetailRetrieve**](NotesApi.md#notesdetailretrieve) | **GET** /api/notes/detail/{id} | جزئیات یادداشت
[**notesListList**](NotesApi.md#noteslistlist) | **GET** /api/notes/list | لیست یادداشت‌ها
[**notesUpdatePartialUpdate**](NotesApi.md#notesupdatepartialupdate) | **PATCH** /api/notes/update/{id} | ویرایش جزئی یادداشت
[**notesUpdateUpdate**](NotesApi.md#notesupdateupdate) | **PUT** /api/notes/update/{id} | ویرایش یادداشت


# **notesCreateCreate**
> NotesCreateCreate201Response notesCreateCreate(noteWrite)

ایجاد یادداشت جدید

یک یادداشت جدید می‌سازد و در صورت احراز هویت، آن را به کاربر متصل می‌کند.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final noteWrite = NoteWrite(); // NoteWrite | 

try {
    final result = api_instance.notesCreateCreate(noteWrite);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesCreateCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **noteWrite** | [**NoteWrite**](NoteWrite.md)|  | 

### Return type

[**NotesCreateCreate201Response**](NotesCreateCreate201Response.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesDeleteDestroy**
> notesDeleteDestroy(id)

حذف یادداشت

حذف یادداشت بر اساس شناسه.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | 

try {
    api_instance.notesDeleteDestroy(id);
} catch (e) {
    print('Exception when calling NotesApi->notesDeleteDestroy: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesDetailRetrieve**
> NotesCreateCreate201Response notesDetailRetrieve(id)

جزئیات یادداشت

دریافت اطلاعات کامل یک یادداشت بر اساس شناسه.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | 

try {
    final result = api_instance.notesDetailRetrieve(id);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesDetailRetrieve: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**NotesCreateCreate201Response**](NotesCreateCreate201Response.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesListList**
> NotesListList200Response notesListList(page)

لیست یادداشت‌ها

دریافت لیست یادداشت‌های کاربر یا یادداشت‌های عمومی به صورت صفحه‌بندی‌شده.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final page = 56; // int | A page number within the paginated result set.

try {
    final result = api_instance.notesListList(page);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesListList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| A page number within the paginated result set. | [optional] 

### Return type

[**NotesListList200Response**](NotesListList200Response.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesUpdatePartialUpdate**
> NotesCreateCreate201Response notesUpdatePartialUpdate(id, patchedNoteWrite)

ویرایش جزئی یادداشت

ویرایش بخشی از اطلاعات یادداشت.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | 
final patchedNoteWrite = PatchedNoteWrite(); // PatchedNoteWrite | 

try {
    final result = api_instance.notesUpdatePartialUpdate(id, patchedNoteWrite);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesUpdatePartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **patchedNoteWrite** | [**PatchedNoteWrite**](PatchedNoteWrite.md)|  | [optional] 

### Return type

[**NotesCreateCreate201Response**](NotesCreateCreate201Response.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesUpdateUpdate**
> NotesCreateCreate201Response notesUpdateUpdate(id, noteWrite)

ویرایش یادداشت

ویرایش کامل عنوان، محتوا یا دسته‌بندی یادداشت.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | 
final noteWrite = NoteWrite(); // NoteWrite | 

try {
    final result = api_instance.notesUpdateUpdate(id, noteWrite);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesUpdateUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **noteWrite** | [**NoteWrite**](NoteWrite.md)|  | 

### Return type

[**NotesCreateCreate201Response**](NotesCreateCreate201Response.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

