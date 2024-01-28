import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: const Center(
                    child: Divider(
                      thickness: 3,
                      color: Colors.grey,
                      indent: 140,
                      endIndent: 140,
                    ),
                  ),
                )),
            expandedHeight: 350,
            elevation: 0,
            pinned: true,
            //backgroundColor: const Color(0xFF39A552),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AppImages.family,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 800,
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "args.author ?? " "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_alarm,
                          color: Color(0xFF919090),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                         " args.publishedAt?.substring(0, 10) ?? """,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "args.description ?? " "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
