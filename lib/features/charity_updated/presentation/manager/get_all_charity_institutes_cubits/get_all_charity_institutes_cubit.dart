import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/charity_institute.dart';
import '../../../domain/repo/charity_institute_firebase_repo.dart';
part 'get_all_charity_institutes_state.dart';

class GetAllCharityInstitutesCubit extends Cubit<GetAllCharityInstitutesState> {
  GetAllCharityInstitutesCubit() : super(GetAllCharityInstitutesInitial());
  final CharityInstituteFirebaseRepo _charityInstituteFirebaseRepo =
      CharityInstituteFirebaseRepo();
  void getAllCharityInsistutes() async {
    emit(GetAllCharityInstitutesLoading());

    try {
      List<CharityInstitute> charityInstitutes =
          await _charityInstituteFirebaseRepo.getAllCharityInsitutes();
      emit(GetAllCharityInstitutesLoaded(charityInstitutes: charityInstitutes));
    } catch (e) {
      emit(GetAllCharityInstitutesError());
    }
  }
}
