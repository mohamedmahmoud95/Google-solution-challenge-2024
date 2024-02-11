import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'dart:ui';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;

class FaceFeaturesExtractorUtils {

  Future<List?> getFeatures(
      File? userImage, String model, outputSize, inputSize) async {
    Rect? userFaceBox = await _detectFaces(userImage);
    if (userFaceBox == null) return null;

    List preProcessedImage =
        await _preProcessImage(userImage, userFaceBox, inputSize);

    final userOutput =
        List<double>.filled(outputSize, 1).reshape([1, outputSize]);
    tfl.InterpreterOptions options = tfl.InterpreterOptions();
    options.threads = Platform.numberOfProcessors - 1;
    final interpreter =
        await tfl.Interpreter.fromAsset(model, options: options);

    interpreter.run(preProcessedImage, userOutput);

    interpreter.close();

    return userOutput[0];
  }


  Future<List> _preProcessImage(File? userImage, faceBox, inputSize) async {
    img.Image? decodedUserImage = await img.decodeImageFile(userImage!.path);
    if (decodedUserImage!.numChannels > 3) {
      decodedUserImage = decodedUserImage.convert(numChannels: 3);
    }
    img.Image croppedUserFace = _cropImageToBox(decodedUserImage, faceBox);
    List preProcessedImage = img
        .copyResize(croppedUserFace, width: inputSize, height: inputSize)
        .toUint8List()
        .reshape([1, inputSize, inputSize, 3]);
    return preProcessedImage;
  }
  Future<Rect?> _detectFaces(File? userImage) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final List<Face> imgFaces =
        await faceDetector.processImage(InputImage.fromFile(userImage!));
    faceDetector.close();
    if (imgFaces.isEmpty || imgFaces.length > 1) return null;
    return imgFaces[0].boundingBox;
  }

  img.Image _cropImageToBox(imageInput, boundingBox) {
    return img.copyCrop(
      imageInput!,
      x: boundingBox.left.toInt(),
      y: boundingBox.top.toInt(),
      width: boundingBox.width.toInt(),
      height: boundingBox.height.toInt(),
    );
  }
}
