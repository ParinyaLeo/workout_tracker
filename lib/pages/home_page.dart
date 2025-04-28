import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../widgets/workout_tile.dart';
import 'add_workout_page.dart';
import 'summary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Workout> workouts = [];
  String selectedTypeFilter = 'All';

  final List<String> workoutTypes = [
    'All',
    'Running',
    'Push-ups',
    'Sit-ups',
    'Cycling',
  ];

  void _addWorkout(Workout workout) {
    setState(() {
      workouts.add(workout);
    });
  }

  void _deleteWorkout(int index) {
    setState(() {
      workouts.removeAt(index);
    });
  }

  List<Workout> get filteredWorkouts {
    if (selectedTypeFilter == 'All') {
      return workouts;
    } else {
      return workouts.where((workout) => workout.type == selectedTypeFilter).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryPage(workouts: workouts),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedTypeFilter,
              items: workoutTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTypeFilter = value!;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Select Workout Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredWorkouts.isEmpty
                  ? const Center(child: Text('No workout records yet.'))
                  : ListView.builder(
                      itemCount: filteredWorkouts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: WorkoutTile(
                            workout: filteredWorkouts[index],
                            onDelete: () => _deleteWorkout(workouts.indexOf(filteredWorkouts[index])),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          final workout = await Navigator.push<Workout>(
            context,
            MaterialPageRoute(builder: (context) => const AddWorkoutPage()),
          );
          if (workout != null) {
            _addWorkout(workout);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
