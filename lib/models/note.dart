import 'category.dart';

class Note {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category? category;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.category,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    final categoryJson = json['category'];

    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      category: categoryJson == null
          ? null
          : Category.fromJson(categoryJson as Map<String, dynamic>),
    );
  }
}
