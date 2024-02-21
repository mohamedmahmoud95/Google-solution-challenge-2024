import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/data/lost_or_found_persons_firebase.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';


class LostOrFoundPersonsRepo {
  final LostOrFoundPersonsFirebase _lostOrFoundPersonsFirebase =
      LostOrFoundPersonsFirebase();
  Future<List<LostOrFoundPerson>> scanForLostOrFoundPerson({required File? image, required bool isLostPerson,required String? textToSearchBy}) async {
    List<LostOrFoundPerson> lostOrFoundPersons = [];

    final results = await _lostOrFoundPersonsFirebase
        .scanForLostOrFoundPerson(image: image, isLostPerson: isLostPerson, textToSearchBy: textToSearchBy);
    final QuerySnapshot<Map<String, dynamic>>? dataSnapshot = results?[0] as QuerySnapshot<Map<String, dynamic>>?;
    final List<String> imageList = results?[1] as List<String>;

    if (dataSnapshot == null) {
      return [];
    }

    if(imageList.isEmpty){
      for (var doc in dataSnapshot.docs) {
        lostOrFoundPersons.add(LostOrFoundPerson.fromMap(doc.data()));
      }
    }else{
      for (String imageID in imageList) {
        for (var doc in dataSnapshot.docs) {
          if(doc.data()['id'] == imageID){
            lostOrFoundPersons.add(LostOrFoundPerson.fromMap(doc.data()));
          }
        }
      }
    }

    return lostOrFoundPersons;
  }

  Future<void> uploadLostOrFoundPerson(
      {required File image,
      required bool isLostPerson,
      required LostOrFoundPerson lostOrFoundPerson}) async {

    await _lostOrFoundPersonsFirebase.uploadLostOrFoundPerson(
        image: image,
        isLostPerson: isLostPerson,
        lostOrFoundPerson: lostOrFoundPerson);
  }
}
