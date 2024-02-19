import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            title: const Text(
              "Payment",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Top up Method",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Add New Card",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Pay with Debit/Credit Card",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 20,
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
