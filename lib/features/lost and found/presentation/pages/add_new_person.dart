import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_solution_challenge_2024/core/aboud_amr_code/aboud/Widgets/CustomDialogs.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/text_fields/text_field.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/image_picker.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';
import '../../data/lost_or_found_persons_firebase.dart';
import '../../../../core/utils/app_colors.dart';

class AddNewLostOrFoundPerson extends StatefulWidget {
  final LostOrFound lostOrFound;
  const AddNewLostOrFoundPerson({super.key, required this.lostOrFound});

  @override
  State<AddNewLostOrFoundPerson> createState() => _AddNewLostOrFoundPersonState();
}

class _AddNewLostOrFoundPersonState extends State<AddNewLostOrFoundPerson> {
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
        title: Text("Add new ${widget.lostOrFound == LostOrFound.lost? 'lost' : 'found'} person"),
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
                onTap: () async {
                  showLoadingDialog(context, 'Uploading');
                  await submit(context);
                  Navigator.pop(context);
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
        File? tempImage = await getImage();
        setState(() {
          imageFile = tempImage; 
        });
      },
      child:
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.oliveGreen1,
                    child: imageFile == null ?  CircleAvatar(
                      radius: 85,
                      backgroundImage: AssetImage(AppImages.profile),
                      backgroundColor: AppColors.oliveGreen1,
                    ):
                    CircleAvatar(
                      radius: 95,
                      backgroundImage: FileImage(imageFile!),
                      backgroundColor: AppColors.oliveGreen1,
                    )
                  ),
                  const CircleAvatar(
                    radius: 23,
                    backgroundColor: Color.fromARGB(255, 110, 109, 109),
                    child: Icon(
                      color: AppColors.appleWhite,
                      Icons.camera_alt_rounded,
                      size: 20,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<String?> submit(context) {
    //1- create a new instance of lostOrFoundPerson
    LostOrFoundPerson newLostOrFoundPerson = LostOrFoundPerson();
    
    if (firstNameController.text.isNotEmpty) {
      newLostOrFoundPerson.firstName = firstNameController.text.toLowerCase();
    }
    if (lastNameController.text.isNotEmpty) {
      newLostOrFoundPerson.lastName = lastNameController.text.toLowerCase();
    }
    if (firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty) {
      newLostOrFoundPerson.fullName = "${firstNameController.text.toLowerCase()} ${lastNameController.text.toLowerCase()}";
    }
    if (lastSeenlocationController.text.isNotEmpty) {
      newLostOrFoundPerson.lastSeenLocation = lastSeenlocationController.text;
    }
    if (nationalIdController.text.isNotEmpty) {
      newLostOrFoundPerson.nationalId = nationalIdController.text;
    }
    if (ageController.text.isNotEmpty) {
      newLostOrFoundPerson.age = ageController.text;
    }
    if (registeredAddressController.text.isNotEmpty) {
      newLostOrFoundPerson.address = registeredAddressController.text;
    }
    if (careGiverPhoneNumberController.text.isNotEmpty) {
      newLostOrFoundPerson.careGiverPhoneNumber = careGiverPhoneNumberController.text;
    }

    if (imageFile != null && imageFile
        .toString()
        .isNotEmpty == false) {
      //edit this one
      newLostOrFoundPerson.imageUrl = imageFile.toString();
    }

    newLostOrFoundPerson.lostOrFound = widget.lostOrFound;

    return LostOrFoundPersonsFirebase().uploadLostOrFoundPerson(lostOrFoundPerson: newLostOrFoundPerson, image: imageFile!, isLostPerson: (widget.lostOrFound == LostOrFound.lost ? true : false));

  }
}
