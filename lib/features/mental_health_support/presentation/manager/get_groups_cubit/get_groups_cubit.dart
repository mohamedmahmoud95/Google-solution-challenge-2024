import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/groups_firestore_repo.dart';
part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  GetGroupsCubit() : super(GetGroupsInitial());
  final GroupsFirestoreRepo _groupsFirestoreRepo =
      GroupsFirestoreRepo();

  void getAllGroups() async {
    emit(GetGroupsLoading());
    try {
      List<Group> groups =
          await _groupsFirestoreRepo.getAllGroups();
      emit(GetGroupsLoaded(groups: groups));
    } catch (e) {
      debugPrint("$e");
      emit(GetGroupsError());
    }
  }
}
