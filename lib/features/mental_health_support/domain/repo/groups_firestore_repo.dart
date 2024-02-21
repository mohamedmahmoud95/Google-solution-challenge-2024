import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
import 'package:uuid/uuid.dart';

class GroupsFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();

  Future<List<Group>> getAllGroups() async {
    var data = await _generalCrudFirestore
        .generalGetCollection(AppFirestoreCollections.groupsCollection);
    List<Group> allGroups = [];
    for (var doc in data.docs) {
      allGroups.add(Group.fromMap(doc.data()));
    }
    return allGroups;
  }

  Future<void> addGroup(Group group) async {
    await _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.groupsCollection,
        Uuid().v1(),
        group.toMap());
  }

  Future<void> updateGroupAppointees(
      String professionalId, List<String> allAppointees) async {
    await _generalCrudFirestore.generalUpdatedocInAppCollection(
        collectionName: AppFirestoreCollections.groupsCollection,
        docId: professionalId,
        docData: {"allAppointeesIds": allAppointees});
  }
}
