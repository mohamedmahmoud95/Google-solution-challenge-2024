import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lost_and_found_state.dart';

class LostAndFoundCubit extends Cubit<LostAndFoundState> {
  LostAndFoundCubit() : super(LostAndFoundInitial());
}
