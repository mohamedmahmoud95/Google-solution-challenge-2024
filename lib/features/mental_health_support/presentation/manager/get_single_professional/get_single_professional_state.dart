part of 'get_single_professional_cubit.dart';

sealed class GetSingleProfessionalState extends Equatable {
  const GetSingleProfessionalState();

  @override
  List<Object> get props => [];
}

final class GetSingleProfessionalInitial extends GetSingleProfessionalState {}

final class GetSingleProfessionalLoading extends GetSingleProfessionalState {}

final class GetSingleProfessionalLoaded extends GetSingleProfessionalState {
  final Professional professional;

 const GetSingleProfessionalLoaded({required this.professional});
}

final class GetSingleProfessionalError extends GetSingleProfessionalState {}
