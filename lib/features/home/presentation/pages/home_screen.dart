import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Add your logic for when item 1 is tapped
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Add your logic for when item 2 is tapped
                  },
                ),
              ],
            ),
          ),
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.white,
                title: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome back",
                        style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Mohamed!",
                        style: TextStyle(fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: HomeCubit.get(context)
                    .widgetOptions[HomeCubit.get(context).selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
