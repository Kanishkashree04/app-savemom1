import 'package:flutter/material.dart';

class BodyTempChart extends StatelessWidget {
  const BodyTempChart({super.key});

  @override
  Widget build(BuildContext context) {
    final temps = [36.6, 36.8, 37.0, 37.2, 36.9, 36.7, 36.5];
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final minTemp = 36.0;
    final maxTemp = 38.0;

    return Scaffold(
      appBar: AppBar(  // Removed the duplicate AppBar declaration
        title: const Text(
          'Body Temperature',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // Header
            const Text(
              'Weekly Temperature Trend',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 20),

            // Chart with Y-axis
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Y-axis labels
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$maxTemp°C', style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 40),
                    Text('${(maxTemp+minTemp)/2}°C', style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 40),
                    Text('$minTemp°C', style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(width: 8),

                // Bars
                Expanded(
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(temps.length, (index) {
                        final height = ((temps[index] - minTemp) / (maxTemp - minTemp)) * 150;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 28,
                              height: height,
                              decoration: BoxDecoration(
                                color: temps[index] > 37.2
                                    ? Colors.orange[400]
                                    : Colors.blue[400],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(days[index]),
                            Text(
                              '${temps[index]}°C',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegend(Colors.blue[400]!, 'Normal (≤37.2°C)'),
                const SizedBox(width: 20),
                _buildLegend(Colors.orange[400]!, 'Elevated (>37.2°C)'),
              ],
            ),
            const SizedBox(height: 24),

            // Summary
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Text(
                    'Healthy range: 36.5°C - 37.5°C',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('• Above 37.5°C may indicate fever'),
                  Text('• Below 36.5°C may indicate hypothermia'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}