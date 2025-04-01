import 'package:flutter/material.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // Changed from AppBar() to appBar: AppBar()
        title: const Text(
          "Sleep",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Your Sleep Duration",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "7 hrs 30 mins",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: 7.5 / 8,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 12,
            ),
            const SizedBox(height: 20),
            const Text(
              "Sleep Tips:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.pink),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "✔ Maintain a consistent sleep schedule.\n"
                        "✔ Avoid screen time 1 hour before sleep.\n"
                        "✔ Keep your bedroom dark and cool.\n"
                        "✔ Avoid caffeine before bedtime.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}