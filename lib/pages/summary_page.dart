import 'package:flutter/material.dart';
import '../models/workout.dart';

class SummaryPage extends StatelessWidget {
  final List<Workout> workouts;

  const SummaryPage({Key? key, required this.workouts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalWorkouts = workouts.length;
    final Map<String, int> typeCounts = {};

    for (var workout in workouts) {
      typeCounts[workout.type] = (typeCounts[workout.type] ?? 0) + 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Workouts: $totalWorkouts',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            const Text('Workouts by Type:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: typeCounts.isEmpty
                  ? const Center(child: Text('No workouts recorded.'))
                  : ListView.builder(
                      itemCount: typeCounts.length,
                      itemBuilder: (context, index) {
                        String type = typeCounts.keys.elementAt(index);
                        int count = typeCounts[type]!;
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(type),
                            trailing: Text('$count times'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
