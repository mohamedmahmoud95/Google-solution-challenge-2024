import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/manager/charity_cubit.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/manager/charity_state.dart';
import '../widgets/build_payment_method_tile.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharityCubit(),
      child: BlocConsumer<CharityCubit, CharityState>(
        listener: (BuildContext context, Object? state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Payment",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.sp,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                right: 20.w, left: 20.w, top: 8.h, bottom: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Top up Method",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Add New Card",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BuildPaymentMethodTile(
                        title: "Paypal",
                        value: "Paypal",
                        groupValue:
                            CharityCubit.get(context).selectedPaymentMethod,
                        onChanged:
                            CharityCubit.get(context).onPaymentMethodChange,
                        image: AppImages.paypal,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BuildPaymentMethodTile(
                        title: "Google Pay",
                        value: "Google Pay",
                        groupValue:
                            CharityCubit.get(context).selectedPaymentMethod,
                        onChanged:
                            CharityCubit.get(context).onPaymentMethodChange,
                        image: AppImages.google,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        "Pay with Debit/Credit Card",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BuildPaymentMethodTile(
                        title: "Master Card",
                        value: "Master Card",
                        groupValue:
                            CharityCubit.get(context).selectedPaymentMethod,
                        onChanged:
                            CharityCubit.get(context).onPaymentMethodChange,
                        image: AppImages.mastercard,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BuildPaymentMethodTile(
                        title: "Visa",
                        value: "Visa",
                        groupValue:
                            CharityCubit.get(context).selectedPaymentMethod,
                        onChanged:
                            CharityCubit.get(context).onPaymentMethodChange,
                        image: AppImages.visa,
                      ),
                    ],
                  ),
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
                    onPressed: () {},
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
      ),
    );
  }
}
