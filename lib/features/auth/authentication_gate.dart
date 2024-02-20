import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../home/presentation/pages/home_screen.dart';
import '../landing_screen/presentation/pages/landing_screen.dart';

class UserAccessToken {
  static String? accessToken;
}

Key landingScreenKey = UniqueKey();

class AuthenticationGate extends StatefulWidget {
  const AuthenticationGate({Key? key}) : super(key: key);

  @override
  State<AuthenticationGate> createState() => _AuthenticationGateState();
}

class _AuthenticationGateState extends State<AuthenticationGate> {
  // Add a flag to keep track of whether authentication has been checked.
  bool isAuthChecked = false;
  late Future<bool> isAuthenticated;
  Future<bool> checkAccessToken() async {
    // final sharedPreferences = await SharedPreferences.getInstance();

    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );

    final securedStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
    UserAccessToken.accessToken =
        await securedStorage.read(key: 'access_token');
    //  debugPrint("Fetched access token: ${UserAccessToken.accessToken}");
    if (UserAccessToken.accessToken != null &&
        UserAccessToken.accessToken!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    isAuthenticated = checkAccessToken();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isAuthChecked) {
      checkAccessToken().then((authResult) {
        setState(() {
          isAuthChecked = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated == true) {
      return const HomeScreen();
    } else {
      return const LandingScreen();
    }
  }
}
