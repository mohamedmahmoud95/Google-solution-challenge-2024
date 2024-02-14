
class AppUser {
  String? id ;
  String? email ;
  String? password ;
  String? firstName ;
  String? lastName ;
  String? phoneNumber ;
  String? profilePicUrl ;
  String? about ;
  List<String>? idsOfAnotherUsersChattedWith = [];
  List<String>? likedPostsIds = [];
  List<String>? friendsUsersIds = [];
  bool isTherapist = false;
  List<String>? bookedAppointmentsIDs = [];

  AppUser({
     this.id,
     this.email,
     this.password,
     this.firstName,
     this.lastName,
     this.phoneNumber,
     this.profilePicUrl,
     this.about,
     this.idsOfAnotherUsersChattedWith,
     this.friendsUsersIds,
     this.likedPostsIds,
    this.isTherapist =
    false, //false by default, unless the opposite is explicitly declared
    required this.bookedAppointmentsIDs,
  });
}

AppUser sampleAppUser1 = AppUser(
  firstName: "Mohamed",
  lastName: "Mahmoud",
  email: "m.raslan97@gmail.com",
  phoneNumber: "+201001412578",
  about: "no body, yet",
  password: '12345678',
  profilePicUrl: "assets/images/Mohamed_Mahmoud.png",
  bookedAppointmentsIDs: ['sampleAppointment1', 'sampleAppointment2', 'sampleAppointment5'],
  id: '',
  isTherapist: true,

);

AppUser sampleAppUser2 = AppUser(
  firstName: "Amr",
  lastName: "Haithem",
  email: "amr@gmail.com",
  phoneNumber: "+20444545",
  profilePicUrl: 'assets/images/profile_pic.png',
  about: "..",
  bookedAppointmentsIDs: [],
  id: 'id',
  password: '12345678',

);
AppUser sampleAppUser3 = AppUser(
  firstName: "Abdelrahman",
  lastName: "Ayman",
  email: "top@gmail.com",
  phoneNumber: "+2012323232",
  profilePicUrl: 'assets/images/profile_pic.png',
  about: "..",
  bookedAppointmentsIDs: [],
  id: 'id',
  password: '12345678',

);
AppUser sampleAppUser4 = AppUser(
  firstName: "Eman",
  lastName: "Pepers",
  email: "Eman@gmail.com",
  phoneNumber: "+201234434",
  profilePicUrl: 'assets/images/profile_pic.png',
  about: "..",
  bookedAppointmentsIDs: [],
  id: 'id',
  password: '12345678',

);

AppUser currentAppUser =
AppUser(
  firstName: "Mohamed",
  lastName: "Mahmoud",
  email: "m.raslan97@gmail.com",
  phoneNumber: "+201001412578",
  about: "no body, yet",
  profilePicUrl: "assets/images/Mohamed_Mahmoud.png",
  bookedAppointmentsIDs: ['sampleAppointment1', 'sampleAppointment2', 'sampleAppointment5'],
  id: 'id',
  password: '12345678',

);
//   sampleAppUser1; // a test appUser to use as the current appUser (the one using the app from his phone)


List<AppUser> listOfSampleAppUsers = [sampleAppUser1,sampleAppUser2,sampleAppUser3,sampleAppUser4];