part of 'add_professional_cubit.dart';

sealed class AddProfessionalState extends Equatable {
  const AddProfessionalState();

  @override
  List<Object> get props => [];
}

final class AddProfessionalInitial extends AddProfessionalState {}
final class AddProfessionalLoading extends AddProfessionalState {}
final class AddProfessionalLoaded extends AddProfessionalState {}
final class AddProfessionalError extends AddProfessionalState {}
