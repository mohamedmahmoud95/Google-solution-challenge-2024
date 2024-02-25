import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/domain/temp_data.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/presentation/widget/help_option_widget.dart';

class HelpingOptionsScreen extends StatefulWidget {
  const HelpingOptionsScreen({super.key});

  @override
  State<HelpingOptionsScreen> createState() => _HelpingOptionsScreenState();
}

class _HelpingOptionsScreenState extends State<HelpingOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I want to help"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...helpingOptions.map((helpingOption) => HelpingOptionWidget(helpingOption: helpingOption)),
            ],
          ),
        ),
      ),

    );
  }
}
