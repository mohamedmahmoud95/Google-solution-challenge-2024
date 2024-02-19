import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';

import 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(CharityInitState());

  static CharityCubit get(context) => BlocProvider.of(context);

  List<CharityModel>? charityCards;

  String selectedPaymentMethod = "Master Card";

  void onPaymentMethodChange(value) {
    emit(CharityInitState());
    selectedPaymentMethod = value;
    emit(PaymentMethodChangeState());
  }
}
