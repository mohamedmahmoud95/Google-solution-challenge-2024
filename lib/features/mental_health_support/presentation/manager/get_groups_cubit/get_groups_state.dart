part of 'get_groups_cubit.dart';

sealed class GetGroupsState extends Equatable {
  const GetGroupsState();

  @override
  List<Object> get props => [];
}

final class GetGroupsInitial extends GetGroupsState {}

final class GetGroupsLoading extends GetGroupsState {}

final class GetGroupsLoaded extends GetGroupsState {
  final List<Group> groups;
  const GetGroupsLoaded({required this.groups});
}

final class GetGroupsError extends GetGroupsState {}
