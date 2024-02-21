import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/step.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDB {
  static initHiveDB() async {
    await Hive.initFlutter();

    //register all classes
    Hive.registerAdapter<OfflineResource>(OfflineResourceAdapter());
    Hive.registerAdapter<Step>(StepAdapter());
  }

  Future<Box> openAndGetBox({required boxName}) async {
    if (!(Hive.isBoxOpen(boxName))) {
      return await Hive.openBox(boxName);
    } else {
      return Hive.box(boxName);
    }
  }

  Future<void> setupInitHiveDbDataIfNonExisting(
      List<OfflineResource> offlineResources) async {
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    await offlineResourcesBox.clear();
    if (offlineResourcesBox.isEmpty) {
      await offlineResourcesBox.addAll(offlineResources);
    }
  }

  void printDB() async {
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    for (OfflineResource offlineResource in offlineResourcesBox.values) {
      print("${offlineResource.id} ${offlineResource.summary}");
    }
  }
}
