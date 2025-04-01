import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  const Weight({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWeight = 65; // Example weight (you can make this dynamic)
    double goalWeight = 70; // Example goal weight

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "WEIGHT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22, // Add this line (adjust the value as needed)
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.pink // Light pastel yellow
      ),
      backgroundColor: Colors.white, // White background for a clean UI
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Your Current Weight",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "$currentWeight kg",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // Weight Progress Bar
            LinearProgressIndicator(
              value: currentWeight / goalWeight,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
              minHeight: 12,
            ),
            const SizedBox(height: 20),

            const Text(
              "Weight Tips:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink, // Green color applied

              ),
            ),
            const SizedBox(height: 10),

            // Center-aligned Weight Tips (now in green)
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "✔ Maintain a balanced diet with protein and fiber.\n"
                        "✔ Stay hydrated and drink plenty of water.\n"
                        "✔ Exercise regularly for at least 30 minutes daily.\n"
                        "✔ Get enough sleep to support metabolism.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}