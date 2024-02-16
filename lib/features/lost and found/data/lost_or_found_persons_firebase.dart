import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_solution_challenge_2024/core/utils/firestore_collections_names.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';
import 'package:path/path.dart';

import '../../../core/utils/face_features_extractor_utils.dart';
import '../../../core/utils/face_recognition_api_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LostOrFoundPersonsFirebase {
  final FirebaseFirestore firestoreDatabase = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  final FaceFeaturesExtractorUtils faceFeaturesExtractorUtils =
      FaceFeaturesExtractorUtils();

  final FaceRecognitionApiUtils _faceRecognitionApiUtils =
      FaceRecognitionApiUtils();

  Future<String?> uploadLostOrFoundPerson(
      {required LostOrFoundPerson lostOrFoundPerson,
      required File image,
      String model = 'assets/models/mobileFaceNet.tflite',
      int outputSize = 192,
      int inputSize = 112,
      required bool isLostPerson}) async {
    //File? image
    // basename(image!.path).split('.')[0];
    List? features = await faceFeaturesExtractorUtils.getFeatures(
        image, model, outputSize, inputSize);
    if (features == null) return null;
    DocumentReference<Map<String, dynamic>> entryRef = firestoreDatabase
        .collection(isLostPerson
            ? FirestoreCollectionsNames.lostPersonsCollection
            : FirestoreCollectionsNames.foundPersonsCollection)
        .doc();
    final imageFileRef =
        storageRef.child('images/${entryRef.id}/${basename(image.path)}');
    await imageFileRef.putFile(image);
    lostOrFoundPerson.imageUrl = await imageFileRef.getDownloadURL();
    await entryRef.set(lostOrFoundPerson.toMap());
    return (await _faceRecognitionApiUtils.uploadRequest(features, entryRef.id))
        .body;
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> scanForLostOrFoundPerson(
      {required File? image,
      String model = "assets/models/mobileFaceNet.tflite",
      int outputSize = 192,
      int inputSize = 112,
      required bool isLostPerson}) async {
    
    QuerySnapshot<Map<String, dynamic>> dataSnapshot;

    if (image != null) {
      List? features = await faceFeaturesExtractorUtils.getFeatures(
        image, model, outputSize, inputSize);
      if (features == null) return null;
      print("i came here");
      print(features);

      List<String>? imageList =
          await _faceRecognitionApiUtils.compareRequest(features);
      print(imageList);
      dataSnapshot = await firestoreDatabase
          .collection(isLostPerson
              ? FirestoreCollectionsNames.lostPersonsCollection
              : FirestoreCollectionsNames.foundPersonsCollection)
          .where("id", whereIn: imageList)
          .get();
    } else {
      dataSnapshot = await firestoreDatabase
          .collection(isLostPerson
              ? FirestoreCollectionsNames.lostPersonsCollection
              : FirestoreCollectionsNames.foundPersonsCollection)
          .get();
    }

    return dataSnapshot;
  }

  // Future multiUpload(
  //     String model, List<XFile> images, outputSize, inputSize) async {
  //   for (var image in images) {
  //     File? imageFile = File(image.path);
  //     String? response = await upload(imageFile, model, outputSize,
  //         inputSize, basename(image.path).split('.')[0]);
  //     if (response == null)
  //       print('Error with Image ${basename(image.path).split('.')[0]}');
  //   }
  // }
}
