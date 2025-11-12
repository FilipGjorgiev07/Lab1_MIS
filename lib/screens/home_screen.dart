import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_title.dart';
import 'exam_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Exam> _generateExams() {
    return [
      Exam(subject: "Вовед во компјутерските науки", dateTime: DateTime(2025, 11, 9, 10, 0), rooms: ["Лаб. 13"]),
      Exam(subject: "Структурно програмирање", dateTime: DateTime(2025, 6, 12, 9, 30), rooms: ["Лаб. 3"]),
      Exam(subject: "Архитектура и организација на компјутери", dateTime: DateTime(2025, 6, 28, 9, 0), rooms: ["Лаб. 215"]),
      Exam(subject: "Математика 1", dateTime: DateTime(2025, 6, 20, 11, 0), rooms: ["Лаб. 2"]),
      Exam(subject: "Математика 2", dateTime: DateTime(2026, 3, 2, 9, 30), rooms: ["Лаб. 215"]),
      Exam(subject: "Објектно ориентирана анализа и дизајн", dateTime: DateTime(2026, 2, 24, 10, 30), rooms: ["Лаб. 12"]),
      Exam(subject: "Професионални вештини", dateTime: DateTime(2025, 7, 5, 8, 0), rooms: ["Лаб. 200в"]),
      Exam(subject: "Бизнис и менаџмент", dateTime: DateTime(2025, 11, 18, 12, 30), rooms: ["Лаб. 200аб"]),
      Exam(subject: "Основи на веб дизајн", dateTime: DateTime(2026, 3, 15, 9, 30), rooms: ["Лаб. 138"]),
      Exam(subject: "Објектно ориентирано програмирање", dateTime: DateTime(2025, 11, 25, 8, 0), rooms: ["Лаб. 200аб"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final exams = _generateExams();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Испити - 231122"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExamDetails(exam: exam)),
            ),
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Вкупно испити: ${exams.length}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
