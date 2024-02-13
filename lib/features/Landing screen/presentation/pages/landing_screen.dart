import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/app%20logo/app_logo.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/Sign%20In/presentation/pages/sign_in_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          width: ScreenUtils.getScreenWidth(context) / 1.2,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppLogo(showName: true,),

            const SizedBox(height: 40,),

            needHelpButton(),
            iAmHereToHelpButton(),
          ],
        ),
      )
      ),
    );
  }

  Widget needHelpButton(){
    return RectangularButton(onTap: (){
      Navigator.of(context).pushNamed('signIn');
    },
      width: 100,
      text: "I need help",
    );
  }

  Widget iAmHereToHelpButton(){
    return RectangularButton(onTap: (){
      Navigator.of(context).pushNamed('signIn');
    },
      width: 100,
      text: "I'm here to help",
    );
  }

}
