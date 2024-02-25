import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/dialogs/alert_dialog.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
class BookGroupSessionScreen extends StatefulWidget {
  final Group group;

  const BookGroupSessionScreen({super.key, required this.group});

  @override
  State<BookGroupSessionScreen> createState() => _BookGroupSessionScreenState();
}

class _BookGroupSessionScreenState extends State<BookGroupSessionScreen> {

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.oliveGreen2, size: 30),
          title: const Text('Book & Join Group',
              style: TextStyle(color: AppColors.black0000, fontSize: 20))
      ),

      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: height*0.8,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 0,
                color: AppColors.offWhite,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child:
                  SingleChildScrollView(child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
            
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image(
                                image:
                                    ImageUtils.getImage(widget.group.photoUrl)!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                                right: 5,
                                child:
                            ratingIndicator()),
                          ],
                        ),
                      ),
            
                      const SizedBox(
                        height: 20,
                      ),
            
                      const SizedBox(
                        width: 200,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          'Group Title',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                      ),
            
                      const SizedBox(
                        height: 5,
                      ),
            
                      SizedBox(
                        width: 200,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          widget.group.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ),
            
                      const SizedBox(
                        height: 20,
                      ),
            
                      const SizedBox(
                        width: 200,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          'Group Therapist',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                      ),
            
                      const SizedBox(
                        height: 5,
                      ),
            
                      const SizedBox(
                        width: 300,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          'Mohammed Dummy Data',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ),
            
                      const SizedBox(
                        height: 20,
                      ),
            
                      const SizedBox(
                        width: 200,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          'Appointees',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                      ),
            
                      const SizedBox(
                        height: 5,
                      ),
            
                      SizedBox(
                        width: 300,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          " ${widget.group.allAppointeesIds.length}/${widget.group.maximumAppointees}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ),
            
                      const SizedBox(
                        height: 20,
                      ),
            
            
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: RectangularButton(text: 'Join group', onTap: () {
                            showErrorDialog(context, 'Session Full', 32.0);
                          },
                          ),
                        ),
                      ),
            
                      const SizedBox(
                        height: 20,
                      ),
            
                    ],
                  ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

   Widget ratingIndicator() {
    return Container(
      width: 75,
      height: 32.5,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.oliveGreen1.withOpacity(1),
        border: Border.all(width: 0.5, color: AppColors.oliveGreen1),
        borderRadius: const BorderRadius.all(
            Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.black0000,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "${widget.group.rating}",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17,
              color: AppColors.black0000,
            ),
          ),
        ],
      ),
    );
  }

}
