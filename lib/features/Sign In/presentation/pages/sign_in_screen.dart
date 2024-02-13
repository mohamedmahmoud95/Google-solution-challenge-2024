import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/app%20logo/app_logo.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            const SizedBox(
              height: 30,
            ),
            // loginTitle(),
            // const SizedBox(
            //   height: 20,
            // ),
            emailTextField(),
            passwordTextField(),
            const SizedBox(
              height: 30,
            ),
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

  Widget emailTextField() {
    return Padding(
      padding: EdgeInsets.all(30),
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

  Widget signInButton() {
    return GestureDetector(
      onTap: () {
        signIn();
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

  void signIn() {}

  Widget signUpInstead() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
