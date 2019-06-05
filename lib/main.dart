import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ImagePickerExample());
}

class ImagePickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Picker(),
    );
  }
}

class Picker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PickerState();
  }
}

class PickerState extends State<Picker> {
  File cameraFile;

  @override
  Widget build(BuildContext context) {
    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      print("You selected camera image : " + cameraFile.path);
      setState(() {});
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25.0),
              child: FloatingActionButton(
                backgroundColor: Colors.pink,
                child: Icon(Icons.photo_camera),
                onPressed: imageSelectorCamera,
              ),
            ),
            displaySelectedFile(cameraFile)
          ],
        ),
      ),
    );
  }

  Widget displaySelectedFile(File file) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        height: 400.0,
        child: file == null ? Icon(Icons.image) : Image.file(file),
      ),
    );
  }
}
