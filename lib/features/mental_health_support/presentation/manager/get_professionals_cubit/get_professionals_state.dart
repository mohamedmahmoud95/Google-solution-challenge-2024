part of 'get_professionals_cubit.dart';

sealed class GetProfessionalsState extends Equatable {
  const GetProfessionalsState();

  @override
  List<Object> get props => [];
}

final class GetProfessionalsInitial extends GetProfessionalsState {}

final class GetProfessionalsLoading extends GetProfessionalsState {}

final class GetProfessionalsLoaded extends GetProfessionalsState {
  final List<Professional> professionals;
  const GetProfessionalsLoaded({required this.professionals});
}

final class GetProfessionalsError extends GetProfessionalsState {}
