import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/general_data.dart';
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
    Hive.registerAdapter<GeneralData>(GeneralDataAdapter());
  }

  Future<Box> openAndGetBox({required boxName}) async {
    if (!(Hive.isBoxOpen(boxName))) {
      return await Hive.openBox(boxName);
    } else {
      return Hive.box(boxName);
    }
  }

  // Future<bool> dataExistInHive()async{
  //       var offlineResourcesBox = await openAndGetBox(
  //       boxName: AppFirestoreCollections.offline_resourcesCollection);
  // }

  Future<bool> versionIsCompatible(String appVersion) async {
    var generalDataBox = await openAndGetBox(
        boxName: AppFirestoreCollections.generalDataCollection);
    if (generalDataBox.values.first == null ||
        appVersion != generalDataBox.values.first) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> setVersion(String appVersion) async {
    var generalDataBox = await openAndGetBox(
        boxName: AppFirestoreCollections.generalDataCollection);
    generalDataBox.clear();
    generalDataBox.add(GeneralData(appVersion: appVersion));
  }

  Future<void> setupInitHiveDbData(
      List<OfflineResource> offlineResources, String newAppVersion) async {
    setVersion(newAppVersion);

    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    offlineResourcesBox.clear();
    if (offlineResourcesBox.isEmpty) {
      await offlineResourcesBox.addAll(offlineResources);
    }
  }

  Future<List<OfflineResource>> getAllOfflineResources() async {
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    return offlineResourcesBox.values.toList() as List<OfflineResource>;
  }

  void printDB() async {
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    for (OfflineResource offlineResource in offlineResourcesBox.values) {
      print("${offlineResource.id} ${offlineResource.summary}");
    }
  }
}
