import 'package:flutter/material.dart';

Widget generateFilterButton(screenWidth, screenHeight, color, textToDisplay, functionToCall, passTextToFunc){
  return GestureDetector(
    onTap: () {
      if(passTextToFunc){
        functionToCall(textToDisplay);
      }else{
        functionToCall();
      }
    },
    child: Container(
      height: screenHeight * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: Text(textToDisplay,
                    style: const TextStyle(color: Colors.white, fontSize: 16))),
          ),
        ],
      ),
    ),
  );
}