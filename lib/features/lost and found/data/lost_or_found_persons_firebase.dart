import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';
import 'package:path/path.dart';

import '../../../core/utils/face_features_extractor_utils.dart';
import '../../../core/utils/face_recognition_api_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/firebase_service/general_crud_firestore.dart';

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
    List? features = await faceFeaturesExtractorUtils.getFeatures(
        image, model, outputSize, inputSize);
    if (features == null) return null;
    DocumentReference<Map<String, dynamic>> entryRef = firestoreDatabase
        .collection(isLostPerson
            ? AppFirestoreCollections.lostPersonsCollection
            : AppFirestoreCollections.foundPersonsCollection)
        .doc();
    final imageFileRef =
        storageRef.child('images/${entryRef.id}/${basename(image.path)}');
    await imageFileRef.putFile(image);
    lostOrFoundPerson.imageUrl = await imageFileRef.getDownloadURL();
    lostOrFoundPerson.id = entryRef.id;
    await entryRef.set(lostOrFoundPerson.toMap());
    return (await _faceRecognitionApiUtils.uploadRequest(features, entryRef.id))
        .body;
  }

  Future<List?> scanForLostOrFoundPerson(
      {required File? image,
      String model = "assets/models/mobileFaceNet.tflite",
      int outputSize = 192,
      int inputSize = 112,
      required bool isLostPerson,
      required String? textToSearchBy}) async {
    QuerySnapshot<Map<String, dynamic>> dataSnapshot;
    List<String> imageList = [];

    CollectionReference<Map<String, dynamic>> collectionReference = firestoreDatabase.collection(
        isLostPerson
              ? AppFirestoreCollections.lostPersonsCollection
              : AppFirestoreCollections.foundPersonsCollection);

    if (image != null) {
      List? features = await faceFeaturesExtractorUtils.getFeatures(
          image, model, outputSize, inputSize);
      if (features == null) return null;

      imageList = await _faceRecognitionApiUtils.compareRequest(features);

      dataSnapshot = await firestoreDatabase
          .collection(isLostPerson
              ? AppFirestoreCollections.lostPersonsCollection
              : AppFirestoreCollections.foundPersonsCollection)
          .where("id", whereIn: imageList)
          .get();

    } else {
// <<<<<<< abdelrahman
      if(textToSearchBy != null){
        dataSnapshot = await collectionReference
        .where('fullName',
            isGreaterThanOrEqualTo: textToSearchBy.toLowerCase())
        .where('fullName',
            isLessThanOrEqualTo: '${textToSearchBy.toLowerCase()}\uf8ff')
        .get();
      }else{
        dataSnapshot = await collectionReference.get();
      }
// =======
//       dataSnapshot = await firestoreDatabase
//           .collection(isLostPerson
//               ? AppFirestoreCollections.lostPersonsCollection
//               : AppFirestoreCollections.foundPersonsCollection)
//           .where('fullName',
//               isGreaterThanOrEqualTo:
//                   textToSearchBy != null ? textToSearchBy.toLowerCase() : "")
//           .where('fullName',
//               isLessThanOrEqualTo: textToSearchBy != null
//                   ? textToSearchBy.toLowerCase() + '\uf8ff'
//                   : "")
//           .get();
// >>>>>>> main
    }
    return [dataSnapshot, imageList];
  }
}
