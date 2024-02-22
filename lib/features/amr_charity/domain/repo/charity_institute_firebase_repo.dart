import 'package:google_solution_challenge_2024/features/amr_charity/data/charity_institute_firebase.dart';
import 'package:google_solution_challenge_2024/features/amr_charity/domain/entities/charity_institute.dart';

class CharityInstituteFirebaseRepo {
  final CharityInstituteFirebase _charityInstituteFirebase =
      CharityInstituteFirebase();
  Future<List<CharityInstitute>> getAllCharityInsitutes() async {
    var data = await _charityInstituteFirebase.getAllCharityInstitutes();
    return data.docs.map((e) => CharityInstitute.fromMap(e.data())).toList();
  }
}
