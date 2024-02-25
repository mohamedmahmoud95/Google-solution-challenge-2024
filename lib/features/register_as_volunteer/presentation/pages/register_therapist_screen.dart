import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/image_picker/image_picker.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/text_fields_and_search_bar/text_field.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/widget/coutry_selection_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/reusable widget/app_logo/app_logo.dart';
import '../../../../core/utils/screen_utils.dart';
import '../manager/register_therapist_cubit.dart';
import '../manager/register_therapist_state.dart';
import '../widgets/bottom.dart';
import '../widgets/check_box.dart';
import '../widgets/cu_dropdown.dart';
import '../widgets/cu_text_field.dart';
import '../widgets/upload_widget.dart';

class RegisterAsVolunteer extends StatefulWidget {
  const RegisterAsVolunteer({super.key});

  @override
  State<RegisterAsVolunteer> createState() => _RegisterAsVolunteerState();
}

class _RegisterAsVolunteerState extends State<RegisterAsVolunteer> {
  File? profilePicFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController yearOfExperienceController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController licensingOrganizationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cvLinkController = TextEditingController();
  TextEditingController licenseLinkController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterTherapistCubit(),
      child: BlocBuilder<RegisterTherapistCubit, RegisterTherapistState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("Sign up"),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [


                ImagePickerWidget(imageFile: profilePicFile,),

                TextFieldWidget(
                  title: 'Full name',
                  textEditingController: nameController,
                ),

                TextFieldWidget(
                  title: 'Email',
                  textEditingController: emailController,
                ),

                TextFieldWidget(
                  title: 'Specialization',
                  textEditingController: specialityController,
                ),

                TextFieldWidget(
                  title: 'Years of experience',
                  textEditingController: yearOfExperienceController,
                ),

                TextFieldWidget(
                  title: 'Licensing organization',
                  textEditingController: licensingOrganizationController,
                ),

                TextFieldWidget(
                  title: 'License number',
                  textEditingController: licenseNumberController,
                ),

                TextFieldWidget(
                  title: 'Link to your CV',
                  textEditingController: cvLinkController,
                ),

                TextFieldWidget(
                  title: 'Link to your license',
                  textEditingController: licenseLinkController,
                ),

                const CountrySelector(),



                // const CuTextField(
                //   name: 'Years of experience',
                //   hintText: "Years*",
                //   keyboardType: TextInputType.number,
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // CuDropdown(
                //   name: 'Gender',
                //   value: RegisterTherapistCubit.get(context).selectedGenderItem,
                //   items: RegisterTherapistCubit.get(context).genderItems,
                //   dropdownOnChange: RegisterTherapistCubit.get(context)
                //       .genderDropdownOnChange,
                //   hint: const Text("Gender"),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // const CuTextField(
                //   name: 'License No.',
                //   hintText: "License No",
                //   keyboardType: TextInputType.number,
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // const CuTextField(
                //   name: 'Licensing Organization',
                //   hintText: "Licensing Organization",
                //   keyboardType: TextInputType.number,
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // CuDropdown(
                //   name: 'Country',
                //   value: RegisterTherapistCubit.get(context).selectedCountyItem,
                //   items: RegisterTherapistCubit.get(context).countries,
                //   dropdownOnChange: RegisterTherapistCubit.get(context)
                //       .countryDropdownOnChange,
                //   hint: const Text("countries"),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // CuDropdown(
                //   name: 'Language',
                //   value:
                //       RegisterTherapistCubit.get(context).selectedLanguageItem,
                //   items: RegisterTherapistCubit.get(context).languages,
                //   dropdownOnChange: RegisterTherapistCubit.get(context)
                //       .languageDropdownOnChange,
                //   hint: const Text("languages"),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // CuDropdown(
                //   name: 'Prefix',
                //   value: RegisterTherapistCubit.get(context).selectedPrefixItem,
                //   items: RegisterTherapistCubit.get(context).namePrefixes,
                //   dropdownOnChange: RegisterTherapistCubit.get(context)
                //       .prefixDropdownOnChange,
                //   hint: const Text("Prefix"),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: Row(
                //     children: [
                //       const UploadWidget(
                //         text: "CV *",
                //       ),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       const UploadWidget(
                //         text: "Certificate(s) *",
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: Text(
                //     "Choose one at least*",
                //     style: TextStyle(
                //         color: Theme.of(context).primaryColorLight,
                //         fontSize: 14.sp,
                //         fontWeight: FontWeight.w500),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: Column(
                //     children: [
                //       MyCheckBox(
                //         title: RegisterTherapistCubit.get(context)
                //             .checkBoxItems[0],
                //         onChanged: () {
                //           RegisterTherapistCubit.get(context).toggleSelection(
                //             RegisterTherapistCubit.get(context)
                //                 .checkBoxItems[0],
                //           );
                //         },
                //         additionalRequirement: true,
                //         value: RegisterTherapistCubit.get(context)
                //             .selectedItems
                //             .contains(RegisterTherapistCubit.get(context)
                //                 .checkBoxItems[0]),
                //         listOfRequirement:
                //             RegisterTherapistCubit.get(context).psychiatrists,
                //       ),
                //       MyCheckBox(
                //         title: RegisterTherapistCubit.get(context)
                //             .checkBoxItems[1],
                //         onChanged: () {
                //           RegisterTherapistCubit.get(context).toggleSelection(
                //             RegisterTherapistCubit.get(context)
                //                 .checkBoxItems[1],
                //           );
                //         },
                //         additionalRequirement: true,
                //         value: RegisterTherapistCubit.get(context)
                //             .selectedItems
                //             .contains(RegisterTherapistCubit.get(context)
                //                 .checkBoxItems[1]),
                //         listOfRequirement:
                //             RegisterTherapistCubit.get(context).clinical,
                //       ),
                //       MyCheckBox(
                //         title: RegisterTherapistCubit.get(context)
                //             .checkBoxItems[2],
                //         onChanged: () {
                //           RegisterTherapistCubit.get(context).toggleSelection(
                //             RegisterTherapistCubit.get(context)
                //                 .checkBoxItems[2],
                //           );
                //         },
                //         value: RegisterTherapistCubit.get(context)
                //             .selectedItems
                //             .contains(RegisterTherapistCubit.get(context)
                //                 .checkBoxItems[2]),
                //         listOfRequirement: const [],
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 30.h,
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),child:RectangularButton(
                  width: ScreenUtils.getScreenWidth(context) / 1.35,

                  text: 'Sign Up',

                    onTap: (){
                  showDialog(context: context, builder: (Context) => const AlertDialog(
                    title: Text('Thank you'),
                    content: Text("We will review your registeration data and get back to your within 3 work days"),
                  ));
                }),),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget fullNameTextField() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Full name",
  //           style: TextStyle(
  //               fontSize: 20,
  //               color: AppColors.grey4,
  //               fontWeight: FontWeight.w600),
  //         ),
  //         TextFieldWidget(
  //           textEditingController: nameController,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
