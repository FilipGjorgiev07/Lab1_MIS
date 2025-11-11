import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final int totalExams;

  const ExamCard({
    super.key,
    required this.exam,
    required this.totalExams,
  });

  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isPast ? Colors.purple.shade100 : Colors.blue.shade100,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isPast ? Icons.check_circle : Icons.pending,
                    color: isPast ? Colors.grey : Colors.indigo,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      exam.subject,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isPast
                            ? Colors.grey.shade700
                            : Colors.indigo.shade900,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.calendar_today_sharp, size: 18),
                  const SizedBox(width: 6),
                  Text(dateFormat.format(exam.dateTime)),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 6),
                  Text(timeFormat.format(exam.dateTime)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.door_front_door, size: 18),
                  const SizedBox(width: 6),
                  Text(exam.rooms.join(", ")),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "Вкупно испити: $totalExams",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.pink,
            ),
          ),
        ),
      ],
    );
  }
}
