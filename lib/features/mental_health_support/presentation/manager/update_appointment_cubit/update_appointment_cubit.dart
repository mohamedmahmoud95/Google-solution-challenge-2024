import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/appointment.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/appoinments_firestore_repo.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/professionals_firestore_repo.dart';

part 'update_appointment_state.dart';

class UpdateAppointmentCubit extends Cubit<UpdateAppointmentState> {
  UpdateAppointmentCubit() : super(UpdateAppointmentInitial());

  ProfessionalsFirestoreRepo _professionalsFirestoreRepo =
      ProfessionalsFirestoreRepo();
  AppointmentsFirestoreRepo _appointmentsFirestoreRepo =
      AppointmentsFirestoreRepo();

  updateAppointmentStatus(Status status, String appointmentId,
      String professionalId, List<String> allAppointeesIds) async {
    emit(UpdateAppointmentLoading());
    try {
      await _appointmentsFirestoreRepo.updateAppointmentStatus(
          status, appointmentId);
      await _professionalsFirestoreRepo.updateProfessionalAppointees(
          professionalId, allAppointeesIds);

      emit(UpdateAppointmentLoaded());
    } catch (e) {
      emit(UpdateAppointmentError());
    }
  }

  // completeAppointmentStatus(String appointmentId, String professionalId,
  //     List<String> allAppointeesIds) {
  //   emit(UpdateAppointmentLoading());
  //   try {
  //     _appointmentsFirestoreRepo.updateAppointmentStatus(stat, appointmentId);

  //     emit(UpdateAppointmentLoaded());
  //   } catch (e) {
  //     emit(UpdateAppointmentError());
  //   }
  // }
}
