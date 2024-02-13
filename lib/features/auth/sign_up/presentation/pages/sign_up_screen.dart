import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';

import '../../../../../core/reusable widget/app_logo/app_logo.dart';


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

  Widget fullNameTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
        signUp();
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

  void signUp() {
    Navigator.of(context).pushReplacementNamed('home');
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
