import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/text_fields/text_field.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/image_picker.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';

class AddNewLostOrFoundPerson extends StatelessWidget {
  final LostOrFound lostOrFound;
  AddNewLostOrFoundPerson({super.key, required this.lostOrFound});
  File? imageFile;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController registeredAddressController = TextEditingController();
  TextEditingController lastSeenlocationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController careGiverPhoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new ${lostOrFound == LostOrFound.lost? 'lost' : 'found'} person"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagePicker(),
            TextFieldWidget(title: 'First name', textEditingController: firstNameController),
            TextFieldWidget(title: 'Last name',  textEditingController: lastNameController),
            TextFieldWidget(title: 'Last seen location', textEditingController: lastSeenlocationController),
            TextFieldWidget(title: 'National id', textEditingController: nationalIdController),
            TextFieldWidget(title: 'Age', textEditingController: ageController),
            TextFieldWidget(title: 'Registered address', textEditingController: registeredAddressController),
            TextFieldWidget(title: 'Care-giver phone number', textEditingController: careGiverPhoneNumberController),

            RectangularButton(
              text: 'Submit',
                onTap: (){
                  submit();
            }
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget imagePicker() {
    return GestureDetector(
      onTap: () async {
        imageFile = await getImage();
      },
      child:
          const Padding(padding: EdgeInsets.all(30),child:
          Column(
            children: [
              Row(
            children:[
              Text(
                'Upload picture',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.grey4,
                ),
              ),]),
      SizedBox(height: 10,),
      CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.oliveGreen1,

        child: CircleAvatar(
        radius: 45,
        backgroundImage: AssetImage(AppImages.profile),
        backgroundColor: AppColors.oliveGreen1,
      ),),
            ],
          ),),
    );

  }

  void submit() {
    //1- create a new instance of lostOrFoundPerson
    LostOrFoundPerson newLostOrFoundPerson = LostOrFoundPerson();
    if (firstNameController.text != null &&
        firstNameController.text.isNotEmpty == false) {
      newLostOrFoundPerson.firstName = firstNameController.text;
    }
    if (lastNameController.text != null &&
        lastNameController.text.isNotEmpty == false) {
      newLostOrFoundPerson.lastName = lastNameController.text;
    }

    if (lastSeenlocationController.text != null &&
        lastSeenlocationController.text.isNotEmpty == false) {
      newLostOrFoundPerson.lastSeenLocation = lastSeenlocationController.text;
    }


    if (nationalIdController.text != null &&
        nationalIdController.text.isNotEmpty == false) {
      newLostOrFoundPerson.nationalId = nationalIdController.text;
    }


    if (ageController.text != null && ageController.text.isNotEmpty == false) {
      newLostOrFoundPerson.age = ageController.text;
    }


    if (registeredAddressController.text != null &&
        registeredAddressController.text.isNotEmpty == false) {
      newLostOrFoundPerson.address = registeredAddressController.text;
    }


    if (careGiverPhoneNumberController.text != null &&
        careGiverPhoneNumberController.text.isNotEmpty == false) {
      newLostOrFoundPerson.careGiverPhoneNumber =
          careGiverPhoneNumberController.text;
    }


    if (imageFile != null && imageFile
        .toString()
        .isNotEmpty == false) {
      //edit this one
      newLostOrFoundPerson.imageUrl = imageFile.toString();
    }

    newLostOrFoundPerson.lostOrFound = lostOrFound;

    //Upload data();
  }
}
