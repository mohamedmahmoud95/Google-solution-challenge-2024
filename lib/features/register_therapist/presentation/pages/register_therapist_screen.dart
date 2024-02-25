import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/features/register_therapist/presentation/manager/register_therapist_cubit.dart';
import 'package:google_solution_challenge_2024/features/register_therapist/presentation/manager/register_therapist_state.dart';
import 'package:google_solution_challenge_2024/features/register_therapist/presentation/widgets/bottom.dart';
import '../../../../../core/reusable widget/app_logo/app_logo.dart';
import '../widgets/check_box.dart';
import '../widgets/cu_dropdown.dart';
import '../widgets/cu_text_field.dart';
import '../widgets/upload_widget.dart';

class RegisterTherapist extends StatelessWidget {
  const RegisterTherapist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterTherapistCubit(),
      child: BlocBuilder<RegisterTherapistCubit, RegisterTherapistState>(
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const AppLogo(
                  showName: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CuTextField(
                  name: 'Years of experience',
                  hintText: "Years*",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CuDropdown(
                  name: 'Gender',
                  value: RegisterTherapistCubit.get(context).selectedGenderItem,
                  items: RegisterTherapistCubit.get(context).genderItems,
                  dropdownOnChange: RegisterTherapistCubit.get(context)
                      .genderDropdownOnChange,
                  hint: const Text("Gender"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CuTextField(
                  name: 'License No.',
                  hintText: "License No",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CuTextField(
                  name: 'Licensing Organization',
                  hintText: "Licensing Organization",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CuDropdown(
                  name: 'Country',
                  value: RegisterTherapistCubit.get(context).selectedCountyItem,
                  items: RegisterTherapistCubit.get(context).countries,
                  dropdownOnChange: RegisterTherapistCubit.get(context)
                      .countryDropdownOnChange,
                  hint: const Text("countries"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CuDropdown(
                  name: 'Language',
                  value:
                      RegisterTherapistCubit.get(context).selectedLanguageItem,
                  items: RegisterTherapistCubit.get(context).languages,
                  dropdownOnChange: RegisterTherapistCubit.get(context)
                      .languageDropdownOnChange,
                  hint: const Text("languages"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CuDropdown(
                  name: 'Prefix',
                  value: RegisterTherapistCubit.get(context).selectedPrefixItem,
                  items: RegisterTherapistCubit.get(context).namePrefixes,
                  dropdownOnChange: RegisterTherapistCubit.get(context)
                      .prefixDropdownOnChange,
                  hint: const Text("Prefix"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      const UploadWidget(
                        text: "CV *",
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      const UploadWidget(
                        text: "Certificate(s) *",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Choose one at least*",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      MyCheckBox(
                        title: RegisterTherapistCubit.get(context)
                            .checkBoxItems[0],
                        onChanged: () {
                          RegisterTherapistCubit.get(context).toggleSelection(
                            RegisterTherapistCubit.get(context)
                                .checkBoxItems[0],
                          );
                        },
                        additionalRequirement: true,
                        value: RegisterTherapistCubit.get(context)
                            .selectedItems
                            .contains(RegisterTherapistCubit.get(context)
                                .checkBoxItems[0]),
                        listOfRequirement:
                            RegisterTherapistCubit.get(context).psychiatrists,
                      ),
                      MyCheckBox(
                        title: RegisterTherapistCubit.get(context)
                            .checkBoxItems[1],
                        onChanged: () {
                          RegisterTherapistCubit.get(context).toggleSelection(
                            RegisterTherapistCubit.get(context)
                                .checkBoxItems[1],
                          );
                        },
                        additionalRequirement: true,
                        value: RegisterTherapistCubit.get(context)
                            .selectedItems
                            .contains(RegisterTherapistCubit.get(context)
                                .checkBoxItems[1]),
                        listOfRequirement:
                            RegisterTherapistCubit.get(context).clinical,
                      ),
                      MyCheckBox(
                        title: RegisterTherapistCubit.get(context)
                            .checkBoxItems[2],
                        onChanged: () {
                          RegisterTherapistCubit.get(context).toggleSelection(
                            RegisterTherapistCubit.get(context)
                                .checkBoxItems[2],
                          );
                        },
                        value: RegisterTherapistCubit.get(context)
                            .selectedItems
                            .contains(RegisterTherapistCubit.get(context)
                                .checkBoxItems[2]),
                        listOfRequirement: const [],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                MyBottom(
                  text: "Submit",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
