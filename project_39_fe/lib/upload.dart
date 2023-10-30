import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _pickedFile;
  String? _objName;
  String? _category;
  String? _desc;
  String? _location;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  Future<void> _uploadData() async {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: _pickFile,
            child: const Text('Pick a File'),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) => _objName = value,
            decoration: const InputDecoration(labelText: 'Object Name'),
          ),
          TextField(
            onChanged: (value) => _category = value,
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          TextField(
            onChanged: (value) => _desc = value,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          TextField(
            onChanged: (value) => _location = value,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _uploadData,
            child: const Text('Upload Data'),
          ),
        ],
      ),
    );
  }
}
