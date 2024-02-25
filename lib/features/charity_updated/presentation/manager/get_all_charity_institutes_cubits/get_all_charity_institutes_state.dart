part of 'get_all_charity_institutes_cubit.dart';

sealed class GetAllCharityInstitutesState extends Equatable {
  const GetAllCharityInstitutesState();

  @override
  List<Object> get props => [];
}

final class GetAllCharityInstitutesInitial
    extends GetAllCharityInstitutesState {}

final class GetAllCharityInstitutesLoading
    extends GetAllCharityInstitutesState {}

final class GetAllCharityInstitutesLoaded extends GetAllCharityInstitutesState {
  final List<CharityInstitute> charityInstitutes;

  GetAllCharityInstitutesLoaded({required this.charityInstitutes});
}

final class GetAllCharityInstitutesError extends GetAllCharityInstitutesState {}
