import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/professionals_firestore_repo.dart';

part 'add_professional_state.dart';

class AddProfessionalCubit extends Cubit<AddProfessionalState> {
  AddProfessionalCubit() : super(AddProfessionalInitial());
  final ProfessionalsFirestoreRepo _professionalsFirestoreRepo =
      ProfessionalsFirestoreRepo();

  void addProfessional(Professional professional) async {
    emit(AddProfessionalLoading());
    try {
      await _professionalsFirestoreRepo.addProfessional(professional);
      emit(AddProfessionalLoaded());
    } catch (e) {
      emit(AddProfessionalError());
    }
  }
}
