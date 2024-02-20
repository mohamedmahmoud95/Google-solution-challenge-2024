
import 'dart:io';

import 'package:image_picker/image_picker.dart';

File? imgFile;

late String imageUrl;

void pickImage() async {
  var image = await ImagePicker().pickImage(source: ImageSource.camera);

  if (image != null) {
    imgFile = File(image.path);
    //notifyListeners();
    // uploadImageToFirebaseStorage();
  }
}

Future<File?> getImage() async {
  final pickedFile =
  await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    imgFile = File(pickedFile.path);
    return imgFile;
    // notifyListeners();

    //   uploadImageToFirebaseStorage();
  }
  else
    return null;
}