import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
import '../widget/therapist_card.dart';

class BookOneToOneSessionScreen extends StatefulWidget {
  final Professional therapist;

  const BookOneToOneSessionScreen({super.key, required this.therapist});

  @override
  State<BookOneToOneSessionScreen> createState() => _BookOneToOneSessionScreenState();
}

class _BookOneToOneSessionScreenState extends State<BookOneToOneSessionScreen> {

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<TimeOfDay> _availableTimes = [
    const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 10, minute: 30),
    const TimeOfDay(hour: 12, minute: 0),
    const TimeOfDay(hour: 13, minute: 30),
    const TimeOfDay(hour: 15, minute: 0),
    const TimeOfDay(hour: 16, minute: 30),
    const TimeOfDay(hour: 18, minute: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.oliveGreen2, size: 30),
          title: const Text('Book an Appointment',
              style: TextStyle(color: AppColors.black0000, fontSize: 20))
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height:12),

            TherapistCard(professionalTherapist: widget.therapist),

            const SizedBox(height:12),

            const SizedBox(height: 20),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
              Center(
                child: RectangularButton(
                  text:  _selectedDate == null ? 'Click to select a date' : _selectedDate.toString().substring(0, 10),
                  childWidget:  const Icon(Icons.calendar_month_rounded,),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now().add(const Duration(days: 1)),
                      lastDate: DateTime.now().add(const Duration(days: 14)),

                    ).then((value) {
                      setState(() {
                        _selectedDate = value;
                      });
                    });
                  },

                ),
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Choose a time:',
                style: TextStyle(fontSize: 18,  color: Colors.black),
              ),
            ),

            const SizedBox(height: 10),
            Expanded(

              child: ListView.builder(
                itemCount: _availableTimes.length,
                itemBuilder: (context, index) {
                  final time = _availableTimes[index];
                  return Column(
                    children: [
                      const Divider(),
                      Center(
                        child: ListTile(
                          leading: const Icon(Icons.alarm, color: AppColors.oliveGreen2,),
                          title: Text(time.format(context),
                            style: const TextStyle(fontSize: 18,  color: Colors.black),),
                          trailing: _selectedTime == time ? const Icon(Icons.check, color: AppColors.oliveGreen2,)  : null,
                          onTap: () {
                            setState(() {
                              _selectedTime = time;

                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:      Center(
                child: RectangularButton(text: 'Book now', onTap: () {
                  if (_selectedDate == null || _selectedTime == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Missing Information',
                          style: TextStyle(fontSize: 18,  color: Colors.black),),
                        content: const Text('Please select a date and time',
                          style: TextStyle(fontSize: 18,  color: Colors.black),),
                        actions: [

                          Center(child: RectangularButton(text: 'OK', onTap: () => Navigator.pop(context)))

                        ],
                      ),
                    );
                  }
                },

                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
