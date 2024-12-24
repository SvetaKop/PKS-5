import 'package:flutter/material.dart';
import 'package:hello_app/model/note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      final newTea = Tea(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _nameController.text,
        description: _descriptionController.text,
        image: _imageController.text,
        price: _priceController.text,
      );
      Navigator.pop(context, newTea);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить новый товар'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите название товара';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите описание товара';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'Фото'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите URL фотографии товара';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Цена'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите цену товара';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                child: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}