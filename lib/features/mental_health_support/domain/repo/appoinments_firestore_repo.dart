import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_solution_challenge_2024/core/firebase_service/general_crud_firestore.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/appointment.dart';
import 'package:uuid/uuid.dart';

class AppointmentsFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Appointment>> getAppointmentsForUser(String userId) async {
    var data = await _firebaseFirestore
        .collection(AppFirestoreCollections.appointmentCollection)
        .where("userId", isEqualTo: userId)
        .get();
    List<Appointment> appointments = [];
    for (var doc in data.docs) {
      appointments.add(Appointment.fromMap(doc.data()));
    }
    return appointments;
  }

  Future<List<Appointment>> getAppointmentsForProffessional(
      String professionalId) async {
    var data = await _firebaseFirestore
        .collection(AppFirestoreCollections.appointmentCollection)
        .where("professionalId", isEqualTo: professionalId)
        .get();
    List<Appointment> appointments = [];
    for (var doc in data.docs) {
      appointments.add(Appointment.fromMap(doc.data()));
    }
    return appointments;
  }

  Future<void> addAppointment(Appointment appointment) async {
    await _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.appointmentCollection,
        Uuid().v1(),
        appointment.toMap());
  }

  Future<void> updateAppointmentStatus(Status status, String appointmentId) async {
    await _generalCrudFirestore.generalUpdatedocInAppCollection(
        collectionName: AppFirestoreCollections.appointmentCollection,
        docId: appointmentId,
        docData: {"status": status.index});
  }
}
