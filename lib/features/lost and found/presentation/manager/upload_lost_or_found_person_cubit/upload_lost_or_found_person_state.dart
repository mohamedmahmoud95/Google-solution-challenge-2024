part of 'upload_lost_or_found_person_cubit.dart';

sealed class UploadLostOrFoundPersonState extends Equatable {
  const UploadLostOrFoundPersonState();

  @override
  List<Object> get props => [];
}

final class UploadLostOrFoundPersonInitial extends UploadLostOrFoundPersonState {}
final class UploadLostOrFoundPersonLoading extends UploadLostOrFoundPersonState {}
final class UploadLostOrFoundPersonLoaded extends UploadLostOrFoundPersonState {}
final class UploadLostOrFoundPersonError extends UploadLostOrFoundPersonState {}
