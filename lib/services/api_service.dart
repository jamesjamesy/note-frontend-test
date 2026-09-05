import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/note.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000';

  // ذخیره توکن کاربر فعلی در حافظه سرویس
  String? token;

  // ساخت خودکار هدرهای درخواست (در صورت وجود توکن، آن را به عنوان Authorization ارسال می‌کند)
  Map<String, String> get _headers {
    final headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = 'Token $token';
    }
    return headers;
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

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    token = data['token'] as String;
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

    if (response.statusCode != 201) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic> && decoded.containsKey('username')) {
        throw Exception('این نام کاربری قبلاً انتخاب شده است.');
      }
      throw Exception('خطا در ثبت‌نام. لطفاً دوباره تلاش کنید.');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    token = data['token'] as String;
    return token!;
  }

  // خروج از حساب: توکن را پاک می‌کند
  void logout() {
    token = null;
  }

  // واکشی یادداشت‌ها با ارسال توکن در هدر
  Future<List<Note>> fetchNotes() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/notes/'),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw Exception('خطا در بارگذاری یادداشت‌ها: ${response.statusCode}');
    }

    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList
        .map((json) => Note.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // واکشی دسته‌بندی‌ها
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/categories/'),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw Exception('خطا در بارگذاری دسته‌بندی‌ها: ${response.statusCode}');
    }

    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // ایجاد یادداشت جدید همراه با ارسال توکن
  Future<void> createNote({
    required String title,
    required String content,
    int? categoryId,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/notes/'),
      headers: _headers,
      body: jsonEncode({
        'title': title,
        'content': content,
        'category': categoryId,
      }),
    );

    if (response.statusCode != 201) {
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        final messages = <String>[];

        for (final entry in decoded.entries) {
          final value = entry.value;

          if (value is List) {
            for (final message in value) {
              messages.add(message.toString());
            }
          } else {
            messages.add(value.toString());
          }
        }

        if (messages.isNotEmpty) {
          throw Exception(messages.join('\n'));
        }
      }

      throw Exception('خطا در ذخیره یادداشت: ${response.statusCode}');
    }
  }
}

