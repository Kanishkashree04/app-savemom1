import 'package:flutter/material.dart';
import 'package:my_app/body_temp.dart';
import 'package:my_app/heart_beat.dart';
import 'package:my_app/blood_press.dart';

class HealthInfoScreen extends StatelessWidget {
  const HealthInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HEALTH INFO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Your Health Stats",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                // Body Temperature Button - Fixed
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BodyTempChart()),
                      );
                    },
                    icon: const Icon(Icons.thermostat, color: Colors.orange),
                    label: const Text(
                      "Body Temperature",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Heart Rate Button - Fixed
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HeartRateChart()),
                      );
                    },
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    label: const Text(
                      "Heart Rate",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Blood Pressure Button - Fixed
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BloodPressureScreen()),
                      );
                    },
                    icon: const Icon(Icons.monitor_heart, color: Colors.blue),
                    label: const Text(
                      "Blood Pressure",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "Daily Health Tips",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "✔ Drink at least 8 glasses of water daily.\n"
                        "✔ Walk at least 10,000 steps a day.\n"
                        "✔ Eat more fruits and vegetables.\n"
                        "✔ Get at least 7 hours of sleep.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
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