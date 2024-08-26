import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Menupost extends StatefulWidget {
  const Menupost({super.key});

  @override
  _MenupostState createState() => _MenupostState();
}

class _MenupostState extends State<Menupost> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  File? imageFile; // 선택된 이미지를 저장할 변수

  final ImagePicker _picker = ImagePicker(); // 이미지를 선택할 ImagePicker 인스턴스

  // 이미지 선택 함수
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile as File?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("메뉴 등록"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 입력 필드
              TextFormField(
                decoration: const InputDecoration(labelText: "제목을 입력하세요."),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "제목을 입력해주세요.";
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 16.0),
              // 내용 입력 필드
              TextFormField(
                decoration: const InputDecoration(labelText: "내용을 입력하세요."),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "내용을 입력해주세요.";
                  }
                  return null;
                },
                onSaved: (value) {
                  description = value;
                },
              ),
              const SizedBox(height: 16.0),
              // 이미지 업로드 버튼
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text("이미지 업로드"),
                  ),
                  const SizedBox(width: 16.0),
                  // 이미지 미리보기
                  if (imageFile != null)
                    Image.file(
                      File(imageFile!.path),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
              const SizedBox(height: 16.0),
              // 저장 버튼
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // 여기서 입력된 데이터를 저장하거나 다른 페이지로 넘기는 로직을 추가할 수 있습니다.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("저장되었습니다.")),
                      );
                    }
                  },
                  child: const Text("저장"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
