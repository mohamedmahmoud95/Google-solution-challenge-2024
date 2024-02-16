import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';

import '../../../domain/repo/professionals_firestore_repo.dart';

part 'get_professionals_state.dart';

class GetProfessionalsCubit extends Cubit<GetProfessionalsState> {
  GetProfessionalsCubit() : super(GetProfessionalsInitial());
  final ProfessionalsFirestoreRepo _professionalsFirestoreRepo =
      ProfessionalsFirestoreRepo();

  void getAllProfessionals() async {
    emit(GetProfessionalsLoading());
    try {
      List<Professional> professionals =
          await _professionalsFirestoreRepo.getAllProfessionals();
      emit(GetProfessionalsLoaded(professionals: professionals));
    } catch (e) {
      emit(GetProfessionalsError());
    }
  }
}
