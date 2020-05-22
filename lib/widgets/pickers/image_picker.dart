import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPicker extends StatefulWidget {
  @override
  _UserPickerState createState() => _UserPickerState();
}

class _UserPickerState extends State<UserPicker> {
  File _pickedImage;

  void _addImage() async {
    final _selectImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = _selectImage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(radius: 40,backgroundImage: _pickedImage != null ?  FileImage(_pickedImage) : null ),
        FlatButton.icon(
          icon: Icon(Icons.image),
          label: Text('Add Image'),
          textColor: Theme.of(context).primaryColor, 
          onPressed: _addImage,
        ),
      ],
    );
  }
}