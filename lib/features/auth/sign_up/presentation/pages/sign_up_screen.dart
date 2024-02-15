import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/auth/firebase_auth_services.dart';

import '../../../../../core/reusable widget/app_logo/app_logo.dart';
import '../../../../../core/reusable widget/dialogs/alert_dialog.dart';
import '../../../../../core/utils/text_validators.dart';
import '../../../app_user.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordIsVisible = false;

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
            const AppLogo(showName: true,),

            fullNameTextField(),
            emailTextField(),
            passwordTextField(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: signUpButton(),
            ),
            const SizedBox(
              height: 20,
            ),
            signInInstead(),
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
          contentText: 'Password most be 8 characters or more'.tr()));
    }
    return valid;
  }

  Widget fullNameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Full name",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.grey4,
                fontWeight: FontWeight.w600),
          ),
          TextField(
            controller: fullNameController,
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
                //hintText: "Full name",
                hintStyle: TextStyle(color: Colors.grey.shade600)),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                //hintText: "Email",
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
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget signUpButton() {
    return GestureDetector(
      onTap: () {
        bool okToProgress =  validateEmail() && validatePassword();
        if (okToProgress) {
          signUp();
        }
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
            "Sign Up",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  final FirebaseAuthServices firebaseAuthServices =  FirebaseAuthServices(FirebaseAuth.instance);

  Future<void> signUp() async {
      bool signUpSuccess = false;
      try {

        final signUpResult = (await firebaseAuthServices
            .registerWithEmailAndPassword(
             emailController.text, passwordController.text, (){}, (){}));

        if (signUpResult != null) {
          signUpSuccess = true;
          currentAppUser = signUpResult;
          Navigator.of(context).pushReplacementNamed('home');
        }
        else {
          showDialog(
            context: context,
            builder: (context) => const AlertDialogWidget(
              title: 'Registration Error',
              contentText:
              'An error occurred.\nPlease try again later.',
            ),
          );
        }
      }catch(e){
        debugPrint("\n unable to register, \n$e\n");
        showDialog(
          context: context,
          builder: (context) => const AlertDialogWidget(
            title: 'Registration Error',
            contentText:
            'An error occured.\nPlease try again later.',
          ),
        );
      }
  }

  Widget signInInstead() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Already have an account?",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.grey4,
            ),
          ),
          GestureDetector(
            onTap: () {
              //Navigate to sign in screen
              Navigator.of(context).pushNamed('signIn');
            },
            child: const Text(
              "Sign In",
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

