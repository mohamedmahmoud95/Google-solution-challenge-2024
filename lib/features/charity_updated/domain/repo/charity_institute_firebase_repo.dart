
import '../../data/charity_institute_firebase.dart';
import '../entities/charity_institute.dart';

class CharityInstituteFirebaseRepo {
  final CharityInstituteFirebase _charityInstituteFirebase =
      CharityInstituteFirebase();
  Future<List<CharityInstitute>> getAllCharityInsitutes() async {
    var data = await _charityInstituteFirebase.getAllCharityInstitutes();
    return data.docs.map((e) => CharityInstitute.fromMap(e.data())).toList();
  }
}
