import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/repositories/lost_or_found_persons_repo.dart';

import '../../../domain/entities/lost_or_found_person.dart';

part 'scan_lost_or_found_person_state.dart';

class ScanLostOrFoundPersonCubit extends Cubit<ScanLostOrFoundPersonState> {
  ScanLostOrFoundPersonCubit() : super(ScanLostOrFoundPersonInitial());
  final LostOrFoundPersonsRepo _lostOrFoundPersonsRepo =
      LostOrFoundPersonsRepo();
  void scanForLostOrFoundPerson(
      {required File? image,
      required bool isLostPerson,
      required String? textToSearchBy}) async {
    emit(ScanLostOrFoundPersonLoading());

    try {
      final lostOrFoundPersons =
          await _lostOrFoundPersonsRepo.scanForLostOrFoundPerson(
              image: image,
              isLostPerson: isLostPerson,
              textToSearchBy: textToSearchBy);
      emit(ScanLostOrFoundPersonLoaded(lostOrFoundPersons: lostOrFoundPersons));
    } catch (e) {
      print("errrorr heree");
      print(e);
      emit(ScanLostOrFoundPersonError());
    }
  }
}
