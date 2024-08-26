import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _description;
  String? _imageUrl;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // 등록 로직을 여기에 추가합니다. 예를 들어, 서버에 데이터를 보내거나 리스트에 추가할 수 있습니다.
      Navigator.pop(context, {
        'name': _name,
        'description': _description,
        'imageUrl': _imageUrl,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('햄버거 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '햄버거 이름'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력하세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '설명'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '설명을 입력하세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '이미지 URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이미지 URL을 입력하세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _imageUrl = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('등록'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
