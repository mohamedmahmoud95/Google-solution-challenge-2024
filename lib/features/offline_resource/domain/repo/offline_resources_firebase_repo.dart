import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/data/hive_db.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/data/offline_resources_firebase.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';

import '../entities/general_data.dart';

class OfflineResourcesFirebaseRepo {
  GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();
  OfflineResourcesFirebase _offlineResourcesFirebase =
      OfflineResourcesFirebase();

  final HiveDB _hiveDB = HiveDB();
  Future<List<OfflineResource>> getAllOfflineResourcesFromFirebase() async {
    var data = await _generalCrudFirestore.generalGetdocInAppCollection(
        AppFirestoreCollections.generalDataCollection, 0.toString());
    GeneralData generalData =
        GeneralData.fromMap(data.data() as Map<String, dynamic>);
    List<OfflineResource> offlineResources = [];

    if (!(await _hiveDB
        .versionIsCompatibleAndDataExists(generalData.appVersion))) {
      var data =
          await _offlineResourcesFirebase.getAllOfflineResourcesFromFirebase();
      // print(data.docs);
      for (var singleData in data.docs) {
        offlineResources
            .add(OfflineResource.fromMapForFirebase(singleData.data()));
      }
      _hiveDB.setupInitHiveDbData(offlineResources, generalData.appVersion);
    }
    //mr aboud, i know what im doing here, I fetch it again, I know
    offlineResources = await _hiveDB.getAllOfflineResources();

    print(offlineResources);
    return offlineResources;
  }
}
