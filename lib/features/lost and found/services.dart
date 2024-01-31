
import 'dart:io';

import 'package:image_picker/image_picker.dart';
File? img;

late String imageUrl;

void pickImage() async {
  var image = await ImagePicker().pickImage(source: ImageSource.camera);

  if (image != null) {
    img = File(image.path);
    //notifyListeners();
   // uploadImageToFirebaseStorage();
  }
}

Future<void> getImage() async {
  final pickedFile =
  await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    img = File(pickedFile.path);
   // notifyListeners();

 //   uploadImageToFirebaseStorage();
  }
}

// Future<void> uploadImageToFirebaseStorage() async {
//   try {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     firebase_storage.Reference firebaseStorageRef =
//     firebase_storage.FirebaseStorage.instance.ref().child(fileName);
//     firebase_storage.UploadTask uploadTask = firebaseStorageRef.putFile(img!);
//
//     await uploadTask.whenComplete(() async {
//       imageUrl = await firebaseStorageRef.getDownloadURL();
//
//       print("Image uploaded to Firebase Storage: $imageUrl");
//
//       notifyListeners();
//     });
//   } catch (error) {
//     print("Error uploading image to Firebase Storage: $error");
//   }
// }
