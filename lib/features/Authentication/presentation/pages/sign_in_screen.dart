import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          emailTextField(),
          passwordTextField(),

        ],
      ),

    );
  }

  Widget emailTextField(){
    return Padding(
      padding: EdgeInsets.all(30),
        child:
        TextField(
          controller: emailController,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.grey.shade600
            )
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
    );
  }

  Widget passwordTextField(){
    return Padding(
      padding: const EdgeInsets.all(30),
      child:
      TextField(
        controller: passwordController,
        style: const TextStyle(fontSize: 20),
        obscureText: !passwordIsVisible,
        decoration: InputDecoration(
            suffix: GestureDetector(
                onTap: (){
                  setState(() {
                    passwordIsVisible = !passwordIsVisible;
                  });
                },
                child: Icon(passwordIsVisible? Icons.visibility_outlined:Icons.visibility_off_outlined)),
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey.shade600
            )
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,

      ),
    );
  }
}

