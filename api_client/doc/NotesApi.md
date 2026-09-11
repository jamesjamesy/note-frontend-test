# openapi.api.NotesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notesCreate**](NotesApi.md#notescreate) | **POST** /api/notes/ | 
[**notesDestroy**](NotesApi.md#notesdestroy) | **DELETE** /api/notes/{id}/ | 
[**notesList**](NotesApi.md#noteslist) | **GET** /api/notes/ | 
[**notesPartialUpdate**](NotesApi.md#notespartialupdate) | **PATCH** /api/notes/{id}/ | 
[**notesRetrieve**](NotesApi.md#notesretrieve) | **GET** /api/notes/{id}/ | 
[**notesUpdate**](NotesApi.md#notesupdate) | **PUT** /api/notes/{id}/ | 


# **notesCreate**
> NoteWrite notesCreate(noteWrite)



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
    final result = api_instance.notesCreate(noteWrite);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **noteWrite** | [**NoteWrite**](NoteWrite.md)|  | 

### Return type

[**NoteWrite**](NoteWrite.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesDestroy**
> notesDestroy(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | A unique integer value identifying this note.

try {
    api_instance.notesDestroy(id);
} catch (e) {
    print('Exception when calling NotesApi->notesDestroy: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this note. | 

### Return type

void (empty response body)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesList**
> PaginatedNoteList notesList(page)



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
    final result = api_instance.notesList(page);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| A page number within the paginated result set. | [optional] 

### Return type

[**PaginatedNoteList**](PaginatedNoteList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesPartialUpdate**
> NoteWrite notesPartialUpdate(id, patchedNoteWrite)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | A unique integer value identifying this note.
final patchedNoteWrite = PatchedNoteWrite(); // PatchedNoteWrite | 

try {
    final result = api_instance.notesPartialUpdate(id, patchedNoteWrite);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this note. | 
 **patchedNoteWrite** | [**PatchedNoteWrite**](PatchedNoteWrite.md)|  | [optional] 

### Return type

[**NoteWrite**](NoteWrite.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesRetrieve**
> Note notesRetrieve(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | A unique integer value identifying this note.

try {
    final result = api_instance.notesRetrieve(id);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesRetrieve: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this note. | 

### Return type

[**Note**](Note.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notesUpdate**
> NoteWrite notesUpdate(id, noteWrite)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = NotesApi();
final id = 56; // int | A unique integer value identifying this note.
final noteWrite = NoteWrite(); // NoteWrite | 

try {
    final result = api_instance.notesUpdate(id, noteWrite);
    print(result);
} catch (e) {
    print('Exception when calling NotesApi->notesUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this note. | 
 **noteWrite** | [**NoteWrite**](NoteWrite.md)|  | 

### Return type

[**NoteWrite**](NoteWrite.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

