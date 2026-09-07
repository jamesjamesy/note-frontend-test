import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/note.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTest Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final ApiService _apiService = ApiService();

  // نگهداری نام کاربری فرد وارد شده (اگر null باشد یعنی کاربر هنوز لاگین نکرده)
  String? _currentUsername;

  // وضعیت فرم ورود: true یعنی در حالت ورود، false یعنی در حالت ثبت‌نام
  bool _isLoginMode = true;

  // کنترلرهای دریافت نام کاربری و رمز عبور از کاربر
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // وضعیت بارگذاری دکمه لاگین/ثبت‌نام و متن خطا
  bool _isAuthLoading = false;
  String? _authError;

  late Future<List<Note>> _notesFuture;
  late Future<List<Category>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    // در شروع متغیرها آماده می‌شوند، اما واکشی نوت‌ها بعد از لاگین انجام خواهد شد
    _notesFuture = _apiService.fetchNotes();
    _categoriesFuture = _apiService.fetchCategories();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // متد ارسال اطلاعات ورود یا ثبت‌نام به سرور
  Future<void> _submitAuth() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _authError = 'لطفاً نام کاربری و رمز عبور را وارد کنید.';
      });
      return;
    }

    setState(() {
      _isAuthLoading = true;
      _authError = null;
    });

    try {
      if (_isLoginMode) {
        // ورود به حساب
        await _apiService.login(username, password);
      } else {
        // ثبت‌نام حساب جدید
        await _apiService.register(username, password);
      }

      // بعد از ورود موفق: نام کاربری ذخیره شده و لیست نوت‌های اختصاصی کاربر خوانده می‌شود
      setState(() {
        _currentUsername = username;
        _isAuthLoading = false;
        _notesFuture = _apiService.fetchNotes();
        _categoriesFuture = _apiService.fetchCategories();
      });
    } catch (error) {
      setState(() {
        _isAuthLoading = false;
        final message = error.toString();
        _authError = message.startsWith('Exception: ')
            ? message.substring('Exception: '.length)
            : message;
      });
    }
  }

  // متد خروج از حساب کاربری
  void _logout() {
    _apiService.logout();
    setState(() {
      _currentUsername = null;
      _usernameController.clear();
      _passwordController.clear();
      _authError = null;
    });
  }

  Future<void> _createNote(
    String title,
    String content,
    int? categoryId,
  ) async {
    await _apiService.createNote(
      title: title,
      content: content,
      categoryId: categoryId,
    );

    setState(() {
      _notesFuture = _apiService.fetchNotes();
    });
  }

  Future<void> _showCreateNoteDialog() async {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    int? selectedCategoryId;
    String? errorMessage;
    bool isSaving = false;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            Future<void> saveNote() async {
              final title = titleController.text.trim();
              final content = contentController.text.trim();

              if (title.isEmpty) {
                setDialogState(() {
                  errorMessage = 'Title is required.';
                });
                return;
              }

              if (content.isEmpty) {
                setDialogState(() {
                  errorMessage = 'Content is required.';
                });
                return;
              }

              setDialogState(() {
                isSaving = true;
                errorMessage = null;
              });

              try {
                await _createNote(title, content, selectedCategoryId);

                if (dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                }
              } catch (error) {
                final message = error.toString();

                setDialogState(() {
                  isSaving = false;
                  errorMessage = message.startsWith('Exception: ')
                      ? message.substring('Exception: '.length)
                      : message;
                });
              }
            }

            return AlertDialog(
              title: const Text('New Note'),
              content: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      enabled: !isSaving,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: contentController,
                      enabled: !isSaving,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Content',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FutureBuilder<List<Category>>(
                      future: _categoriesFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Text(
                            'Failed to load categories: ${snapshot.error}',
                          );
                        }

                        final categories = snapshot.data ?? [];

                        return DropdownButtonFormField<int>(
                          initialValue: selectedCategoryId,
                          decoration: const InputDecoration(
                            labelText: 'Category',
                            border: OutlineInputBorder(),
                          ),
                          items: categories.map((category) {
                            return DropdownMenuItem<int>(
                              value: category.id,
                              child: Text(category.name),
                            );
                          }).toList(),
                          onChanged: isSaving
                              ? null
                              : (value) {
                                  setDialogState(() {
                                    selectedCategoryId = value;
                                    errorMessage = null;
                                  });
                                },
                        );
                      },
                    ),
                    if (errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSaving
                      ? null
                      : () {
                          Navigator.of(dialogContext).pop();
                        },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: isSaving ? null : saveNote,
                  child: isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );

    titleController.dispose();
    contentController.dispose();
  }

  Future<void> _updateNote(
    int id,
    String title,
    String content,
    int? categoryId,
  ) async {
    await _apiService.updateNote(
      id: id,
      title: title,
      content: content,
      categoryId: categoryId,
    );

    setState(() {
      _notesFuture = _apiService.fetchNotes();
    });
  }

  Future<void> _deleteNote(int id) async {
    await _apiService.deleteNote(id);

    setState(() {
      _notesFuture = _apiService.fetchNotes();
    });
  }

  Future<void> _showEditNoteDialog(Note note) async {
    final titleController = TextEditingController(text: note.title);
    final contentController = TextEditingController(text: note.content);

    int? selectedCategoryId = note.category?.id;
    String? errorMessage;
    bool isSaving = false;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            Future<void> saveEdit() async {
              final title = titleController.text.trim();
              final content = contentController.text.trim();

              if (title.isEmpty) {
                setDialogState(() {
                  errorMessage = 'عنوان نمی‌تواند خالی باشد.';
                });
                return;
              }

              if (content.isEmpty) {
                setDialogState(() {
                  errorMessage = 'متن نمی‌تواند خالی باشد.';
                });
                return;
              }

              setDialogState(() {
                isSaving = true;
                errorMessage = null;
              });

              try {
                await _updateNote(note.id, title, content, selectedCategoryId);

                if (dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                }
              } catch (error) {
                final message = error.toString();

                setDialogState(() {
                  isSaving = false;
                  errorMessage = message.startsWith('Exception: ')
                      ? message.substring('Exception: '.length)
                      : message;
                });
              }
            }

            return AlertDialog(
              title: const Text('ویرایش یادداشت'),
              content: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      enabled: !isSaving,
                      decoration: const InputDecoration(
                        labelText: 'عنوان',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: contentController,
                      enabled: !isSaving,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'متن یادداشت',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FutureBuilder<List<Category>>(
                      future: _categoriesFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Text(
                            'خطا در بارگذاری دسته‌بندی‌ها: ${snapshot.error}',
                          );
                        }

                        final categories = snapshot.data ?? [];

                        return DropdownButtonFormField<int?>(
                          initialValue: selectedCategoryId,
                          decoration: const InputDecoration(
                            labelText: 'دسته‌بندی',
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            const DropdownMenuItem<int?>(
                              value: null,
                              child: Text('بدون دسته‌بندی'),
                            ),
                            ...categories.map((category) {
                              return DropdownMenuItem<int?>(
                                value: category.id,
                                child: Text(category.name),
                              );
                            }),
                          ],
                          onChanged: isSaving
                              ? null
                              : (value) {
                                  setDialogState(() {
                                    selectedCategoryId = value;
                                    errorMessage = null;
                                  });
                                },
                        );
                      },
                    ),
                    if (errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSaving
                      ? null
                      : () {
                          Navigator.of(dialogContext).pop();
                        },
                  child: const Text('انصراف'),
                ),
                ElevatedButton(
                  onPressed: isSaving ? null : saveEdit,
                  child: isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('ذخیره تغییرات'),
                ),
              ],
            );
          },
        );
      },
    );

    titleController.dispose();
    contentController.dispose();
  }

  Future<void> _confirmDeleteNote(Note note) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('حذف یادداشت'),
          content: Text('آیا از حذف یادداشت "${note.title}" مطمئن هستید؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('انصراف'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      try {
        await _deleteNote(note.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('یادداشت با موفقیت حذف شد.')),
          );
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطا در حذف یادداشت: $error')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // دروازه ورود (Auth Gate): اگر کاربر لاگین نکرده، صفحه ورود/ثبت‌نام را نشان بده
    if (_currentUsername == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_isLoginMode ? 'ورود به حساب' : 'ساخت حساب جدید'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isLoginMode ? Icons.lock_outline : Icons.person_add_alt,
                        size: 64,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _isLoginMode ? 'خوش آمدید' : 'ثبت نام کاربر جدید',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'نام کاربری (Username)',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'رمز عبور (Password)',
                          prefixIcon: Icon(Icons.key),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      if (_authError != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          _authError!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isAuthLoading ? null : _submitAuth,
                          child: _isAuthLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : Text(_isLoginMode ? 'ورود' : 'ثبت نام'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: _isAuthLoading
                            ? null
                            : () {
                                setState(() {
                                  _isLoginMode = !_isLoginMode;
                                  _authError = null;
                                });
                              },
                        child: Text(
                          _isLoginMode
                              ? 'حساب کاربری ندارید؟ ثبت نام کنید'
                              : 'قبلاً ثبت‌نام کرده‌اید؟ وارد شوید',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // اگر کاربر وارد شده باشد، صفحه اصلی یادداشت‌های خودش نمایش داده می‌شود
    return Scaffold(
      appBar: AppBar(
        title: Text('یادداشت‌های $_currentUsername'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'خروج از حساب',
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final notes = snapshot.data ?? [];

          if (notes.isEmpty) {
            return const Center(
              child: Text(
                'هنوز هیچ یادداشتی ثبت نکرده‌اید.\nبا دکمه + اولین یادداشت خود را بسازید!',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];

              return ListTile(
                title: Text(note.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.content),
                    const SizedBox(height: 4),
                    if (note.category != null)
                      Text(
                        'دسته: ${note.category!.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 2),
                    Text(
                      'آخرین ویرایش: ${note.updatedAt.toLocal().toString().substring(0, 16)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      tooltip: 'ویرایش یادداشت',
                      onPressed: () => _showEditNoteDialog(note),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      tooltip: 'حذف یادداشت',
                      onPressed: () => _confirmDeleteNote(note),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateNoteDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

