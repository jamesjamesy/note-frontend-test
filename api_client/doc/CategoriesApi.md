# openapi.api.CategoriesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**categoriesListList**](CategoriesApi.md#categorieslistlist) | **GET** /api/categories/list | لیست دسته‌بندی‌ها


# **categoriesListList**
> CategoriesListList200Response categoriesListList()

لیست دسته‌بندی‌ها

دریافت تمامی دسته‌بندی‌های عمومی یادداشت‌ها.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = CategoriesApi();

try {
    final result = api_instance.categoriesListList();
    print(result);
} catch (e) {
    print('Exception when calling CategoriesApi->categoriesListList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CategoriesListList200Response**](CategoriesListList200Response.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

