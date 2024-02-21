import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FirstAidsScreen extends StatefulWidget {
  const FirstAidsScreen({super.key});

  @override
  State<FirstAidsScreen> createState() => _FirstAidsScreenState();
}

class _FirstAidsScreenState extends State<FirstAidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First aids".tr()),
      ),

    );
  }


}
