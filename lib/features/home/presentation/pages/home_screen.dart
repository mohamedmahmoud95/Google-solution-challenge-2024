import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 10,
            leading: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.black12,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * .01, vertical: screenHeight * .008),
              child: const Icon(Icons.person),
            ),
            title: const Text(
              "Hi Mohamed!",
            ),
            actions: [
              Card(
                  color: Colors.white,
                  elevation: 4,
                  child: IconButton(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                  )),
              Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  elevation: 4,
                  child: IconButton(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(Icons.group_add_rounded),
                  )),
            ],
          ),
          const SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: ""),
        ],
      ),
    );
  }
}
