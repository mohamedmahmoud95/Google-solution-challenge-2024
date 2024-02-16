import 'dart:io';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/data/lost_or_found_persons_firebase.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';

import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/manager/upload_lost_or_found_person_cubit/upload_lost_or_found_person_cubit.dart';


class LostOrFoundPersonsRepo {
  final LostOrFoundPersonsFirebase _lostOrFoundPersonsFirebase =
      LostOrFoundPersonsFirebase();
  Future<List<LostOrFoundPerson>> scanForLostOrFoundPerson(
      {required File? image, required bool isLostPerson}) async {
    List<LostOrFoundPerson> lostOrFoundPersons = [];

    final dataSnapshot = await _lostOrFoundPersonsFirebase
        .scanForLostOrFoundPerson(image: image, isLostPerson: isLostPerson);

    if (dataSnapshot == null) {
      return [];
    }
    for (var doc in dataSnapshot.docs) {
      lostOrFoundPersons.add(LostOrFoundPerson.fromMap(doc.data()));
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
