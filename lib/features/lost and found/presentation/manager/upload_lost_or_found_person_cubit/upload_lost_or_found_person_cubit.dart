import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/lost_or_found_person.dart';
import '../../../domain/repositories/lost_or_found_persons_repo.dart';

part 'upload_lost_or_found_person_state.dart';

class UploadLostOrFoundPersonCubit extends Cubit<UploadLostOrFoundPersonState> {
  UploadLostOrFoundPersonCubit() : super(UploadLostOrFoundPersonInitial());
  final LostOrFoundPersonsRepo _lostOrFoundPersonsRepo =
      LostOrFoundPersonsRepo();

  Future<void> uploadLostOrFoundPerson(
      {required File image,
      required bool isLostPerson,
      required LostOrFoundPerson lostOrFoundPerson}) async {
    emit(UploadLostOrFoundPersonLoading());
    try {
      await _lostOrFoundPersonsRepo.uploadLostOrFoundPerson(
          image: image,
          isLostPerson: isLostPerson,
          lostOrFoundPerson: lostOrFoundPerson);

      emit(UploadLostOrFoundPersonLoaded());
    } catch (e) {
      emit(UploadLostOrFoundPersonError());
    }
  }
}
