import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
import 'package:uuid/uuid.dart';

class ProfessionalsFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();

  Future<List<Professional>> getAllProfessionals() async {
    var data = await _generalCrudFirestore
        .generalGetCollection(AppFirestoreCollections.professionalsCollection);
    List<Professional> allProfessionals = [];
    for (var doc in data.docs) {
      allProfessionals.add(Professional.fromMap(doc.data()));
    }
    return allProfessionals;
  }

  Future<void> addProfessional(Professional professional) async {
    await _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.professionalsCollection,
        Uuid().v1(),
        professional.toMap());
  }

  Future<void> updateProfessionalAppointees(
      String professionalId, List<String> allAppointees) async {
    await _generalCrudFirestore.generalUpdatedocInAppCollection(
        collectionName: AppFirestoreCollections.professionalsCollection,
        docId: professionalId,
        docData: {"allAppointeesIds": allAppointees});
  }
}
