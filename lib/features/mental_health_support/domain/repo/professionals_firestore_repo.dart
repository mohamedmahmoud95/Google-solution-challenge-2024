import 'package:google_solution_challenge_2024/data/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';

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
}
