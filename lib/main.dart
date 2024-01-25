import 'package:flutter/material.dart';

void main()
{
  runApp(const PalestineApp());
}

class PalestineApp extends StatefulWidget {
  const PalestineApp({super.key});

  @override
  State<PalestineApp> createState() => _PalestineAppState();
}

class _PalestineAppState extends State<PalestineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(),),
    );
  }
}

