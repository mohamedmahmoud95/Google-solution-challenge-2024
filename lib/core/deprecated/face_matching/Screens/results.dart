import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<Map> userResults = ModalRoute.of(context)!.settings.arguments as List<Map>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Face Recognition Demo', style: TextStyle(color: Colors.black, fontSize: 28, fontFamily: GoogleFonts.openSans().fontFamily),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView.builder(
            itemCount: userResults.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: const Color.fromARGB(255, 221, 188, 188),
                    child: SizedBox(
                      width: screenWidth*0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 100, height: 100,child: Image.network(
                                userResults[index]['url'] as String, fit: BoxFit.scaleDown,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                              )),
                              SizedBox(width: screenWidth*0.03),
                              Text(userResults[index]['name'] as String, style: TextStyle(color: Colors.black, fontSize: 28, fontFamily: GoogleFonts.openSans().fontFamily))
                            ],
                          )
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.03,)
                ],
              );
            },
          ),
        )
      ),
    );
  }
}