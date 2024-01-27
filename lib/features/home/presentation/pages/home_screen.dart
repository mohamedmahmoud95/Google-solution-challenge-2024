import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.grey,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: const Icon(Icons.person),
            ),
            title: const Text(
              "Hi Mohamed!",
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.group_add_rounded)),
            ],
          ),
          const SliverFillRemaining(
            child: Column(
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}
