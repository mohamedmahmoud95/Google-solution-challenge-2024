import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/domain/temp_data.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/presentation/widget/volunteering_option_widget.dart';

class VolunteeringOptionsScreen extends StatefulWidget {
  const VolunteeringOptionsScreen({super.key});

  @override
  State<VolunteeringOptionsScreen> createState() => _VolunteeringOptionsScreenState();
}

class _VolunteeringOptionsScreenState extends State<VolunteeringOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("I want to volunteer"),
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Padding(padding: EdgeInsets.all(20),child:Text("I'm a", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),),

              Center(
                child:Wrap(
                  spacing: 10,
                runSpacing: 10,
                children: [
                  ...volunteeringOptions.map((volunteeringOption) => VolunteeringOptionWidget(volunteeringOption: volunteeringOption)),
                ],
              ),),
              const SizedBox(height: 40,),
            ],
          ),),
        ),
      ),
    );

  }
}
