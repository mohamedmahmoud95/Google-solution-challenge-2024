// // import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
// // import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/professionals_firestore_repo.dart';
// //
// import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
// import 'package:google_solution_challenge_2024/features/lost%20and%20found/data/model/lost_found.dart';
// import 'package:uuid/uuid.dart';

// class StoreDummyData {
//   static generateProfessionals() {
//     // for (var i = 0; i < 20; i++) {
//     //   ProfessionalsFirestoreRepo().addProfessional(Professional(
//     //       id: "id",
//     //       name: "mr prof $i",
//     //       photoUrl: "photoUrl",
//     //       jobTitle: "jobTitle",
//     //       rating: 520,
//     //       timeOfSlotes: [],
//     //       isAvailable: true,
//     //       phoneNumber: "52252252"));
//     // }
//   }

//   static generateLostOrFoundPeople() {
//     GeneralCrudFirestore generalCrudFirestore = GeneralCrudFirestore();

//     for (var i = 0; i < 20; i++) {
//       generalCrudFirestore.generalSetdocInAppCollection(
//           AppFirestoreCollections.lostPersonsCollection,
//           Uuid().v1(),
//           LostOrFoundPerson(
//             age: 22,
//             imageUrl: "f",
//             careGiverPhoneNumber: "525",
//             fullName: "aboud kalb no.$i",
//             address: "asdf",
//             nationalId: "",
//           ).toMap());
//     }
//   }
// }
