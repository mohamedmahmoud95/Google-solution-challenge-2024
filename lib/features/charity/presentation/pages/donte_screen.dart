import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes.dart';
import '../widgets/donate_card.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Donate",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How much wanna donate",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const DonateCard(
                    number: 50,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const DonateCard(
                    number: 100,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const DonateCard(
                    number: 150,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const DonateCard(
                    number: 200,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 148.w,
                            child: const Divider(
                              color: Colors.black54,
                            )),
                        Text(
                          " or ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 148.w,
                          child: const Divider(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 18.h),
                      hintText: "Enter Price Manually",
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.sp,
                          ),
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0.sp),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.payment);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0.h, horizontal: 10.w),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
