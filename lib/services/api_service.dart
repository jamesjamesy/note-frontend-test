import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openapi/api.dart' as openapi;

import '../models/category.dart';
import '../models/note.dart';

class PaginatedResult<T> {
  final List<T> items;
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;
  final String? next;
  final String? previous;

  PaginatedResult({
    required this.items,
    this.currentPage = 1,
    this.perPage = 10,
    this.total = 0,
    this.lastPage = 1,
    this.next,
    this.previous,
  });

  bool get hasNext => currentPage < lastPage;
  bool get hasPrevious => currentPage > 1;
}

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000';

  late final openapi.ApiClient _apiClient;
  late final openapi.NotesApi _notesApi;
  late final openapi.CategoriesApi _categoriesApi;

  ApiService() {
    _apiClient = openapi.ApiClient(basePath: baseUrl);
    _notesApi = openapi.NotesApi(_apiClient);
    _categoriesApi = openapi.CategoriesApi(_apiClient);
  }

  // ذخیره توکن کاربر فعلی در حافظه سرویس و تزریق خودکار به کلاینت OpenAPI
  String? _token;
  String? get token => _token;
  set token(String? val) {
    _token = val;
    if (val != null) {
      _apiClient.addDefaultHeader('Authorization', 'Token $val');
    } else {
      _apiClient.defaultHeaderMap.remove('Authorization');
    }
  }

  // متد ورود کاربر: نام کاربری و رمز را می‌فرستد و توکن دریافتی را ذخیره می‌کند
  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('نام کاربری یا رمز عبور اشتباه است.');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    if (decoded.containsKey('data') && decoded['data'] is Map<String, dynamic>) {
      token = (decoded['data'] as Map<String, dynamic>)['token'] as String;
    } else {
      token = decoded['token'] as String;
    }
    return token!;
  }

  // متد ثبت نام کاربر جدید: کاربر ساخته می‌شود و توکن آن بلافاصله ذخیره می‌شود
  Future<String> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        if (decoded.containsKey('meta') && decoded['meta'] is Map) {
          final meta = decoded['meta'] as Map;
          if (meta['message'] != null) {
            throw Exception(meta['message'].toString());
          }
        }
        if (decoded.containsKey('username')) {
          throw Exception('این نام کاربری قبلاً انتخاب شده است.');
        }
      }
      throw Exception('خطا در ثبت‌نام. لطفاً دوباره تلاش کنید.');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    if (decoded.containsKey('data') && decoded['data'] is Map<String, dynamic>) {
      token = (decoded['data'] as Map<String, dynamic>)['token'] as String;
    } else {
      token = decoded['token'] as String;
    }
    return token!;
  }

  // خروج از حساب: توکن را پاک می‌کند
  void logout() {
    token = null;
  }

  // واکشی یادداشت‌ها به صورت صفحه‌بندی شده توسط کلاینت رسمی OpenAPI
  Future<PaginatedResult<Note>> fetchNotes({int page = 1}) async {
    final response = await _notesApi.notesList(page: page);
    if (response == null) {
      return PaginatedResult<Note>(items: []);
    }

    final notes = response.results
        .map(
          (n) => Note(
            id: n.id,
            title: n.title,
            content: n.content,
            createdAt: n.createdAt,
            updatedAt: n.updatedAt,
            category: n.category != null
                ? Category(id: n.category!.id, name: n.category!.name)
                : null,
          ),
        )
        .toList();

    final lastPage = (response.count / 10).ceil();

    return PaginatedResult<Note>(
      items: notes,
      currentPage: page,
      perPage: 10,
      total: response.count,
      lastPage: lastPage > 0 ? lastPage : 1,
      next: response.next,
      previous: response.previous,
    );
  }

  // واکشی دسته‌بندی‌ها توسط کلاینت رسمی OpenAPI
  Future<List<Category>> fetchCategories() async {
    final response = await _categoriesApi.categoriesList();
    if (response == null) return [];
    return response.results
        .map((c) => Category(id: c.id, name: c.name))
        .toList();
  }

  // ایجاد یادداشت جدید توسط کلاینت رسمی OpenAPI
  Future<void> createNote({
    required String title,
    required String content,
    int? categoryId,
  }) async {
    final noteWrite = openapi.NoteWrite(
      title: title,
      content: content,
      category: categoryId,
    );
    await _notesApi.notesCreate(noteWrite);
  }

  // ویرایش یادداشت موجود توسط کلاینت رسمی OpenAPI
  Future<void> updateNote({
    required int id,
    required String title,
    required String content,
    int? categoryId,
  }) async {
    final noteWrite = openapi.NoteWrite(
      title: title,
      content: content,
      category: categoryId,
    );
    await _notesApi.notesUpdate(id, noteWrite);
  }

  // حذف یادداشت با متد DELETE توسط کلاینت رسمی OpenAPI
  Future<void> deleteNote(int id) async {
    await _notesApi.notesDestroy(id);
  }
}

