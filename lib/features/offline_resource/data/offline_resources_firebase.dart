import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';

class OfflineResourcesFirebase {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();

  Future<QuerySnapshot<Map<String, dynamic>>> getAllOfflineResourcesFromFirebase() {
    return _generalCrudFirestore.generalGetCollection(
        AppFirestoreCollections.offline_resourcesCollection);
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getAllOfflineResourcesFromHive() {
    return _generalCrudFirestore.generalGetCollection(
        AppFirestoreCollections.offline_resourcesCollection);
  }
}
