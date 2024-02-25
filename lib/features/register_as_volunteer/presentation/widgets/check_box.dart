import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/features/register_as_volunteer/presentation/widgets/upload_widget.dart';

class MyCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final bool additionalRequirement;

  final List<String> listOfRequirement;

  final Function onChanged;

  const MyCheckBox(
      {required this.title,
      this.value = false,
      required this.onChanged,
      this.additionalRequirement = false,
      super.key,
      required this.listOfRequirement});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          activeColor: Theme.of(context).primaryColorLight,
          title: Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          value: value,
          onChanged: (_) {
            onChanged();
          },
        ),
        value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UploadWidget(text: "documents*"),
                    SizedBox(
                      height: 20.h,
                    ),
                    additionalRequirement
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Please upload all of the following",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                          vertical: 8.h,
                                        ),
                                        child: Text(
                                          listOfRequirement[index],
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff40697C),
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        height: 0,
                                      ),
                                  itemCount: listOfRequirement.length)
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
