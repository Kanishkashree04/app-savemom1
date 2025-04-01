import 'package:flutter/material.dart';

class HeartRateChart extends StatelessWidget {
  const HeartRateChart({super.key});

  @override
  Widget build(BuildContext context) {
    final rates = [72, 75, 78, 82, 79, 76, 74];
    final oxygenLevels = [98, 97, 96, 95, 97, 98, 99];
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heart Health Monitor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              // Stats Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Heart Rate', '${rates.last} BPM', Icons.favorite, Colors.red),
                  _buildStatCard('Blood Oxygen', '${oxygenLevels.last}%', Icons.water_drop, Colors.blue),
                ],
              ),
              const SizedBox(height: 16),

              // Heart Rate Chart
              _buildChart('Heart Rate (BPM)', rates, 60, 100, Colors.red, days),
              const SizedBox(height: 32),

              // SpO2 Chart
              _buildChart('Blood Oxygen (%)', oxygenLevels, 90, 100, Colors.blue, days),
              const SizedBox(height: 24),

              // Health Tips
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heart Health Tips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[700],
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildTip('Regular exercise improves heart rate'),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 7),
            Text(title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(String title, List<int> values, int min, int max, Color color, List<String> days) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Y-axis
                  SizedBox(
                    width: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$max', style: const TextStyle(fontSize: 12)),
                        Text('${(max + min) ~/ 2}', style: const TextStyle(fontSize: 12)),
                        Text('$min', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Bars
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: values.length,
                      itemBuilder: (context, index) {
                        final height = ((values[index] - min) / (max - min)) * 150;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 28,
                                height: height,
                                decoration: BoxDecoration(
                                  color: color, // Solid color without opacity
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${values[index]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                days[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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

  Widget _buildTip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.pink),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
                text,
                style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}