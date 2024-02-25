import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/amr_charity/domain/entities/charity_institute.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource_step.dart';
import 'package:uuid/uuid.dart';

class StoreDummyData {
  static generateCharityInstitutes() {
    GeneralCrudFirestore general = GeneralCrudFirestore();
    for (var i = 0; i < 20; i++) {
      general.generalSetdocInAppCollection(
          AppFirestoreCollections.charityInstituteCollection,
          Uuid().v1(),
          CharityInstitute(
            name: 'Helping Hands Foundation',
            mission: 'Empowering communities through education and healthcare',
            imageUrl: 'https://example.com/logo.png',
            supportedCauses: ['Education', 'Healthcare', 'Poverty Alleviation'],
            fundsRaised: 520,
          ).toMap());
    }
  }

  static generateOfflineResource() {
    GeneralCrudFirestore general = GeneralCrudFirestore();
    for (var i = 0; i < 20; i++) {
      var id = Uuid().v1();
      general.generalSetdocInAppCollection(
          AppFirestoreCollections.offline_resourcesCollection,
          id,
          OfflineResource(
                  id: id,
                  title: "some titles $i",
                  generalIntro: "generalIntro",
                  offlineResourceSteps: [
                    OfflineResourceStep(
                        id: Uuid().v1(),
                        index: "1",
                        title: "title step ",
                        imageLink: "",
                        bodyText: "bodyText")
                  ],
                  summary: "summary",
                  imageUrl: '')
              .toMapForFirebase());
    }
  }
}