import 'package:flutter/material.dart';
import 'package:my_app/health_info.dart'; // Verify this path
import 'package:my_app/weight.dart';
import 'package:my_app/bmi.dart';
import 'package:my_app/sleep.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SAVEMOM", // This is intentional (ignore typo warning)
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink, // Changed to pink
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/savemom.png'), // Ensure this image exists
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Welcome to SaveMom! 🌸\nYour personalized health companion.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavButton(context, "Weight", const Weight()),
                  const SizedBox(height: 20),
                  _buildNavButton(context, "BMI", const BMI()),
                  const SizedBox(height: 20),
                  _buildNavButton(context, "Health Info", const HealthInfoScreen()),
                  const SizedBox(height: 20),
                  _buildNavButton(context, "Sleep", const SleepScreen()),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(Icons.local_fire_department, Colors.red, "1200 kcal", "Calories"),
                        _buildStatItem(Icons.directions_walk, Colors.blue, "8500", "Steps"),
                        _buildStatItem(Icons.location_on, Colors.green, "5.2 km", "Distance"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String text, Widget screen) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold, // Added bold style
          ),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Text(text),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, Color color, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: color, size: 40),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}