import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/appointment.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/appoinments_firestore_repo.dart';

part 'add_appointment_state.dart';

class AddAppointmentCubit extends Cubit<AddAppointmentState> {
  AddAppointmentCubit() : super(AddAppointmentInitial());
  final AppointmentsFirestoreRepo _appointmentsFirestoreRepo =
      AppointmentsFirestoreRepo();
  void addAppointment(Appointment appointment) async {
    emit(AddAppointmentLoading());
    try {
      await _appointmentsFirestoreRepo.addAppointment(appointment);
      emit(AddAppointmentLoaded());
    } catch (e) {
      emit(AddAppointmentError());
    }
  }
}
