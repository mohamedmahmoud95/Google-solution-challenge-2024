import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/groups_firestore_repo.dart';
part 'add_group_state.dart';

class AddGroupCubit extends Cubit<AddGroupState> {
  AddGroupCubit() : super(AddGroupInitial());
  final GroupsFirestoreRepo _groupsFirestoreRepo =
      GroupsFirestoreRepo();

  void addProfessional(Group group) async {
    emit(AddGroupLoading());
    try {
      await _groupsFirestoreRepo.addGroup(group);
      emit(AddGroupLoaded());
    } catch (e) {
      emit(AddGroupError());
    }
  }
}
