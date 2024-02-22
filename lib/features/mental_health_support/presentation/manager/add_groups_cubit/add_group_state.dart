part of 'add_group_cubit.dart';

sealed class AddGroupState extends Equatable {
  const AddGroupState();

  @override
  List<Object> get props => [];
}

final class AddGroupInitial extends AddGroupState {}
final class AddGroupLoading extends AddGroupState {}
final class AddGroupLoaded extends AddGroupState {}
final class AddGroupError extends AddGroupState {}
