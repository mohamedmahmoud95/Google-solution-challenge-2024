import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/appointment.dart';

import '../../../domain/repo/appoinments_firestore_repo.dart';

part 'get_appoinments_state.dart';

class GetAppoinmentsCubit extends Cubit<GetAppoinmentsState> {
  GetAppoinmentsCubit() : super(GetAppoinmentsInitial());
  final AppointmentsFirestoreRepo _appointmentsFirestoreRepo =
      AppointmentsFirestoreRepo();

  void getAppointmentsForProffessional(String professionalId) async {
    emit(GetAppoinmentsLoading());
    try {
      List<Appointment> appointments = await _appointmentsFirestoreRepo
          .getAppointmentsForProffessional(professionalId);
      emit(GetAppoinmentsLoaded(appointments: appointments));
    } catch (e) {
      emit(GetAppoinmentsError());
    }
  }

  void getAppointmentsForUser(String userId) async {
    emit(GetAppoinmentsLoading());
    try {
      List<Appointment> appointments =
          await _appointmentsFirestoreRepo.getAppointmentsForUser(userId);
      emit(GetAppoinmentsLoaded(appointments: appointments));
    } catch (e) {
      emit(GetAppoinmentsError());
    }
  }
}
