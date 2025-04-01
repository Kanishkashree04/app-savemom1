import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    double bmiValue = 22.5; // Example BMI (You can make this dynamic)
    String bmiCategory = "Normal"; // Example category

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 24 // Bold app bar text
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        // Light pastel yellow
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
              "Your BMI Score",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              bmiValue.toStringAsFixed(1), // Display BMI value
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 5),
            Text(
              "Category: $bmiCategory",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // BMI Progress Bar
            LinearProgressIndicator(
              value: bmiValue / 40, // Assuming max BMI value is 40
              backgroundColor: Colors.grey[300],
              color: bmiValue < 18.5
                  ? Colors.orange // Underweight
                  : bmiValue < 25
                  ? Colors.green // Normal
                  : bmiValue < 30
                  ? Colors.yellow // Overweight
                  : Colors.red, // Obese
              minHeight: 12,
            ),
            const SizedBox(height: 20),

            const Text(
              "BMI Tips:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink, // Added this line to make the heading green
              ),
            ),
            const SizedBox(height: 10),

            // Center-aligned BMI Tips (now in green)
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "✔ Maintain a balanced diet with proper nutrition.\n"
                        "✔ Exercise regularly to stay within a healthy range.\n"
                        "✔ Avoid excessive junk food and sugary drinks.\n"
                        "✔ Consult a doctor if your BMI is too low or too high.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500, // Slightly bold
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(), // Pushes the button to the bottom

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}