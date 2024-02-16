part of 'add_appointment_cubit.dart';

sealed class AddAppointmentState extends Equatable {
  const AddAppointmentState();

  @override
  List<Object> get props => [];
}

final class AddAppointmentInitial extends AddAppointmentState {}
final class AddAppointmentLoading extends AddAppointmentState {}
final class AddAppointmentLoaded extends AddAppointmentState {}
final class AddAppointmentError extends AddAppointmentState {}
