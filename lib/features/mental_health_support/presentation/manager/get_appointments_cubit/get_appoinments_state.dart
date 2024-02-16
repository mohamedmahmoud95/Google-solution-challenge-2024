part of 'get_appoinments_cubit.dart';

sealed class GetAppoinmentsState extends Equatable {
  const GetAppoinmentsState();

  @override
  List<Object> get props => [];
}

final class GetAppoinmentsInitial extends GetAppoinmentsState {}

final class GetAppoinmentsLoading extends GetAppoinmentsState {}

final class GetAppoinmentsLoaded extends GetAppoinmentsState {
  final List<Appointment> appointments;

  const GetAppoinmentsLoaded({required this.appointments});
}

final class GetAppoinmentsError extends GetAppoinmentsState {}
