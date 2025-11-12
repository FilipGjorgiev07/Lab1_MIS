import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetails extends StatelessWidget {
  final Exam exam;
  const ExamDetails({super.key, required this.exam});

  String _timeUntilExam() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) return "Испитот е поминат.";

    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;

    return "Преостануваат $days дена и $hours часа.";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.subject,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_sharp),
                    const SizedBox(width: 8),
                    Text(dateFormat.format(exam.dateTime)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    Text(timeFormat.format(exam.dateTime)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.meeting_room_sharp),
                    const SizedBox(width: 8),
                    Text(exam.rooms.join(", ")),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  _timeUntilExam(),
                  style: const TextStyle(fontSize: 16, color: Colors.indigo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
