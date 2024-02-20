import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'app_user.dart';
import 'authentication_gate.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthServices(this._firebaseAuth);

  AppUser? _userFromFirebase(User? user) {
    return user != null
        ? AppUser(
            id: user.uid,
            email: 'example@gmail.com',
            password: '12345678',
            firstName: 'first name',
            lastName: 'last name',
            phoneNumber: '01234567890',
            profilePicUrl: 'assets/images/profile_pic.png',
            about: 'About',
            bookedAppointmentsIDs: [])
        : null;
  }

  Future<AppUser?> registerWithEmailAndPassword(
      String email,
      String password,
      VoidCallback onLoginSuccess,
      VoidCallback onLoginFailed,

      ) async {

    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
         email: email, password: password);

      _userFromFirebase(authResult.user) == null? currentAppUser = sampleAppUser1:
      onLoginSuccess();

      currentAppUser = _userFromFirebase(authResult.user)!;

      return _userFromFirebase(authResult.user);

    } catch (e) {
      debugPrint(e.toString());
      onLoginFailed();
      return null;
    }
  }

  Future<AppUser?> loginWithEmailAndPassword({
    required String email,
    required String password,
    VoidCallback? onLoginSuccess,
    VoidCallback? onLoginFailed,
  }) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      _userFromFirebase(authResult.user) == null? currentAppUser = sampleAppUser1:
      currentAppUser = _userFromFirebase(authResult.user)!;
      if (onLoginSuccess != null) {
        onLoginSuccess();
      }
      const securedStorage =
      FlutterSecureStorage();
      await securedStorage.write(
          key: "access_token", value:authResult.credential!.accessToken! );

      return _userFromFirebase(authResult.user);
    } catch (e) {
      debugPrint(e.toString());
      if (onLoginFailed != null) {
        onLoginFailed();
      }
      return null;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> deleteAccount(String email, String password) async {
    try {
      // Re-authenticate the user with their email and password
      AuthCredential credential = EmailAuthProvider.credential(
          email: '${_firebaseAuth.currentUser?.email}',
          password: password);
      await _firebaseAuth.currentUser
          ?.reauthenticateWithCredential(credential);
      await _firebaseAuth.currentUser?.delete();
      logout();
    } catch (e) {
      debugPrint('Error deleting account: $e');
    }
  }
}
