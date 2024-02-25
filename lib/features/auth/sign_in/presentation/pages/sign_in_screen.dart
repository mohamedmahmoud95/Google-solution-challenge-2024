import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/dialogs/alert_dialog.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/core/utils/text_validators.dart';
import 'package:google_solution_challenge_2024/features/auth/app_user.dart';

import '../../../../../core/reusable widget/app_logo/app_logo.dart';
import '../../../firebase_auth_services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordIsVisible = false;

  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            const AppLogo(
              showName: true,
            ),
            const SizedBox(
              height: 30,
            ),
            emailTextField(),
            passwordTextField(),
            const SizedBox(
              height: 30,
            ),
            forgotPassword(),
            Center(
              child: signInButton(),
            ),
            const SizedBox(
              height: 30,
            ),
            signUpInstead(),
          ],
        ),
      ),
    );
  }

  Widget loginTitle() {
    return const Center(
        child: Text(
      "Login",
      style: TextStyle(
          fontSize: 30, color: AppColors.grey4, fontWeight: FontWeight.w600),
    ));
  }

  bool validateEmail()
  {
    bool valid = TextValidator.validateEmail(emailController.text);
    if (valid == false)
      {
        showDialog(context: context, builder: (context) =>  AlertDialogWidget(
            title: 'Invalid email'.tr(),
            contentText: 'Please enter a valid email address'.tr()));
      }
    return valid;
  }

  bool validatePassword()
  {
    bool valid = TextValidator.validatePassword(passwordController.text);
    if (valid == false)
    {
      showDialog(context: context, builder: (context) =>  AlertDialogWidget(
          title: 'Invalid password'.tr(),
          contentText: 'Invalid password, Please try again'.tr()));
    }
    return valid;
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "E-Mail",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.grey4,
                fontWeight: FontWeight.w600),
          ),
          TextField(
            controller: emailController,
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
                // hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey.shade600)),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Password",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.grey4,
            ),
          ),
          TextField(
            controller: passwordController,
            style: const TextStyle(fontSize: 20),
            obscureText: !passwordIsVisible,
            decoration: InputDecoration(
                suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordIsVisible = !passwordIsVisible;
                      });
                    },
                    child: Icon(passwordIsVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined)),
                //hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey.shade600)),
            onSubmitted: (value) {
              Navigator.of(context).pushReplacementNamed('home');
            },
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget signInButton() {
    return GestureDetector(
      onTap: () {
        // bool okToProgress = validateEmail() && validatePassword();
        // if (okToProgress) {
        //   signIn();
        // }
        Navigator.of(context).pushReplacementNamed('home');
      },
      child: Container(
        height: 50,
        width: ScreenUtils.getScreenWidth(context) / 1.35,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      final signInResult = (await firebaseAuthServices
          .loginWithEmailAndPassword(
          email: emailController.text, password: passwordController.text))!;

      currentAppUser = signInResult;
      Navigator.of(context).pushReplacementNamed('home');
        }catch(e){
      debugPrint("\n unable to login, \n$e\n");
      showDialog(
        context: context,
        builder: (context) => const AlertDialogWidget(
          title: 'Sign in Error',
          contentText:
          'Invalid email or password, \nplease try again',
        ),
      );
    }
  }

  Widget forgotPassword() {
    return Center(child: Padding(
      padding: const EdgeInsets.all(8),
      child:
          GestureDetector(
            onTap: () {
            //  firebaseAuthServices.resetPassword("m.raslan97@gmail.com");
              //Navigator.of(context).pushNamed('signUp');
            },
            child: const Text(
              "Forgot password?",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey4,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),),

    );
  }
  Widget signUpInstead() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Don't have an account yet?",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.grey4,
            ),
          ),
          GestureDetector(
            onTap: () {
              //Navigate to sign up screen
              Navigator.of(context).pushNamed('signUp');
            },
            child: const Text(
              "Sign up",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.grey4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
