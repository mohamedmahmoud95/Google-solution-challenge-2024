import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/data/hive_db.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/general_data.dart';
import 'package:hive/hive.dart';

class OfflineResourcesFirebase {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();
  final HiveDB _hiveDB = HiveDB();

  Future<QuerySnapshot<Map<String, dynamic>>>
      getAllOfflineResourcesFromFirebase() {
    return _generalCrudFirestore.generalGetCollection(
        AppFirestoreCollections.offline_resourcesCollection);
  }

}
