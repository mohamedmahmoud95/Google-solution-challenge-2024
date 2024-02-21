import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/repo/offline_resources_firebase_repo.dart';

part 'offline_resources_state.dart';

class OfflineResourcesCubit extends Cubit<OfflineResourcesState> {
  OfflineResourcesCubit() : super(OfflineResourcesInitial());
  OfflineResourcesFirebaseRepo _offlineResourcesFirebaseRepo =
      OfflineResourcesFirebaseRepo();
  void getAllResources() async {
    emit(OfflineResourcesLoading());
    try {
      List<OfflineResource> offlineResources =
          await _offlineResourcesFirebaseRepo
              .getAllOfflineResourcesFromFirebase();
      emit(OfflineResourcesLoaded(offlineResources: offlineResources));
    } catch (e) {
      emit(OfflineResourcesError());
    }
  }
}
