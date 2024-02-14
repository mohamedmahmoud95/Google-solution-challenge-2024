part of 'scan_lost_or_found_person_cubit.dart';

sealed class ScanLostOrFoundPersonState extends Equatable {
  const ScanLostOrFoundPersonState();

  @override
  List<Object> get props => [];
}

final class ScanLostOrFoundPersonInitial extends ScanLostOrFoundPersonState {}

final class ScanLostOrFoundPersonLoading extends ScanLostOrFoundPersonState {}

final class ScanLostOrFoundPersonLoaded extends ScanLostOrFoundPersonState {
  final List<LostOrFoundPerson> lostOrFoundPersons;
  const ScanLostOrFoundPersonLoaded({required this.lostOrFoundPersons});
}

final class ScanLostOrFoundPersonError extends ScanLostOrFoundPersonState {}
