import 'package:flutter/material.dart';

import '../../../../core/utils/screen_utils.dart';

class MyBottom extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const MyBottom({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('home');
        },
        child: Container(
          height: 50,
          width: ScreenUtils.getScreenWidth(context) / 1.35,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
