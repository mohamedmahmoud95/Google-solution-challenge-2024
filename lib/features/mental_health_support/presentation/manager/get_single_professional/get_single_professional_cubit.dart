import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/professionals_firestore_repo.dart';

part 'get_single_professional_state.dart';

class GetSingleProfessionalCubit extends Cubit<GetSingleProfessionalState> {
  GetSingleProfessionalCubit() : super(GetSingleProfessionalInitial());
  final ProfessionalsFirestoreRepo professionalsFirestoreRepo =
      ProfessionalsFirestoreRepo();

  getSingleProfessional({required String professionalId}) async {
    emit(GetSingleProfessionalLoading());

    try {
      Professional professional = await professionalsFirestoreRepo
          .getSingleProfessional(professionalId);
      emit(GetSingleProfessionalLoaded(professional: professional));
    } catch (e) {
      emit(GetSingleProfessionalError());
    }
  }
}
