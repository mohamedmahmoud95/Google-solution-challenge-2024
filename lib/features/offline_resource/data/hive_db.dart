import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/general_data.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource_step.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDB {
  static initHiveDB() async {
    await Hive.initFlutter();

    //register all classes
    Hive.registerAdapter<OfflineResource>(OfflineResourceAdapter());
    Hive.registerAdapter<OfflineResourceStep>(OfflineResourceStepAdapter());
    Hive.registerAdapter<GeneralData>(GeneralDataAdapter());
  }

  clearHive() async {
    var generalDataBox = await openAndGetBox(
        boxName: AppFirestoreCollections.generalDataCollection);
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    generalDataBox.clear();
    offlineResourcesBox.clear();
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

  Future<bool> versionIsCompatibleAndDataExists(String appVersion) async {
    var generalDataBox = await openAndGetBox(
        boxName: AppFirestoreCollections.generalDataCollection);
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    print("start of execute");
    print(offlineResourcesBox.isEmpty);
    print(generalDataBox.isEmpty);
    print(
        appVersion != (generalDataBox.values.first as GeneralData).appVersion);
    print("doesn't execute");
    if (offlineResourcesBox.isEmpty ||
        generalDataBox.isEmpty ||
        appVersion != (generalDataBox.values.first as GeneralData).appVersion) {
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
    List<OfflineResource> offlineResources = [];

    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);

    offlineResourcesBox.values.forEach((resource) {
      print(resource);
      offlineResources.add(resource as OfflineResource);
    });
    return offlineResources;
  }

  void printDB() async {
    var offlineResourcesBox = await openAndGetBox(
        boxName: AppFirestoreCollections.offline_resourcesCollection);
    for (OfflineResource offlineResource in offlineResourcesBox.values) {
      print("${offlineResource.id} ${offlineResource.summary}");
    }
  }
}
