part of 'update_appointment_cubit.dart';

sealed class UpdateAppointmentState extends Equatable {
  const UpdateAppointmentState();

  @override
  List<Object> get props => [];
}

final class UpdateAppointmentInitial extends UpdateAppointmentState {}

final class UpdateAppointmentLoading extends UpdateAppointmentState {}

final class UpdateAppointmentLoaded extends UpdateAppointmentState {}

final class UpdateAppointmentError extends UpdateAppointmentState {}
