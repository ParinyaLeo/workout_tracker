import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutTile extends StatelessWidget {
  final Workout workout;
  final VoidCallback onDelete;

  const WorkoutTile({
    Key? key,
    required this.workout,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(workout.name),
        subtitle: Text(
          '${workout.type} - ${workout.amount} reps/min\nDate: ${workout.date.toLocal().toString().split(' ')[0]}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
