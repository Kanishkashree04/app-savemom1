import 'package:flutter/material.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - replace with your actual data source
    final systolic = 120;
    final diastolic = 80;
    final heartRate = 72;
    final pulsePressure = systolic - diastolic;
    final bpCategory = _getBPCategory(systolic, diastolic);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Pressure',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Blood Pressure Summary Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'CURRENT READING',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildBPValue('SYS', '$systolic', Colors.red[700]!),
                        const Text(
                          ' / ',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        _buildBPValue('DIA', '$diastolic', Colors.blue[700]!),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bpCategory,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _getBPColor(systolic, diastolic),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'mmHg',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Detailed Metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetricCard('Pulse Pressure', '$pulsePressure mmHg', Icons.show_chart),
                _buildMetricCard('Heart Rate', '$heartRate BPM', Icons.favorite),
              ],
            ),
            const SizedBox(height: 30),

            // Health Status
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [

                  const SizedBox(height: 10),
                  Text(
                    _getBPAdvice(systolic, diastolic),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBPValue(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.pink),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBPCategory(int systolic, int diastolic) {
    if (systolic < 120 && diastolic < 80) return 'Normal';
    if (systolic < 130 && diastolic < 80) return 'Elevated';
    if (systolic < 140 || diastolic < 90) return 'Hypertension Stage 1';
    if (systolic >= 140 || diastolic >= 90) return 'Hypertension Stage 2';
    if (systolic > 180 || diastolic > 120) return 'Hypertensive Crisis';
    return 'Unknown';
  }

  Color _getBPColor(int systolic, int diastolic) {
    if (systolic < 120 && diastolic < 80) return Colors.green;
    if (systolic < 130 && diastolic < 80) return Colors.orange;
    if (systolic < 140 || diastolic < 90) return Colors.orange[800]!;
    return Colors.red;
  }

  String _getBPAdvice(int systolic, int diastolic) {
    if (systolic < 120 && diastolic < 80) {
      return 'Your blood pressure is normal. Maintain a healthy lifestyle.';
    } else if (systolic >= 140 || diastolic >= 90) {
      return 'Your blood pressure is high. Consult your doctor.';
    } else {
      return 'Monitor your blood pressure regularly.';
    }
  }
}