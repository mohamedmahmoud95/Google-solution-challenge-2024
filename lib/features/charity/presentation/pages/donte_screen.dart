import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';

import '../../../../config/routes.dart';
import '../widgets/donate_card.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Donate",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "How much wanna donate",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DonateCard(
                    number: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DonateCard(
                    number: 100,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DonateCard(
                    number: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DonateCard(
                    number: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                            width: HomeCubit.get(context).screenWidth(context) /
                                    2 -
                                39,
                            child: const Divider(
                              color: Colors.black54,
                            )),
                        const Text(
                          " or ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width:
                              HomeCubit.get(context).screenWidth(context) / 2 -
                                  39,
                          child: const Divider(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(23),
                      hintText: "Enter Price Manually",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
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
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.payment);
                  },
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
    );
  }
}
