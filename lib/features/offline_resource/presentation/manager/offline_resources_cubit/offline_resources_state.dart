part of 'offline_resources_cubit.dart';

sealed class OfflineResourcesState extends Equatable {
  const OfflineResourcesState();

  @override
  List<Object> get props => [];
}

final class OfflineResourcesInitial extends OfflineResourcesState {}

final class OfflineResourcesLoading extends OfflineResourcesState {}

final class OfflineResourcesLoaded extends OfflineResourcesState {
  final List<OfflineResource> offlineResources;

  OfflineResourcesLoaded({required this.offlineResources});
}

final class OfflineResourcesError extends OfflineResourcesState {}
