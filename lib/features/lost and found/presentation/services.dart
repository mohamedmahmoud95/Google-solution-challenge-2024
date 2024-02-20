import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;
    return File(image.path);
}