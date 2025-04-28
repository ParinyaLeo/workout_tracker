import 'package:flutter/material.dart';

class WorkoutTipsPage extends StatelessWidget {
  const WorkoutTipsPage({Key? key}) : super(key: key);

  final List<String> workoutTips = const [
    'Always warm up before starting a workout.',
    'Rest between sets for 30-60 seconds.',
    'Stay hydrated during your exercise.',
    'Adjust intensity based on your body\'s capability.',
    'Consistency is more important than intensity.',
    'Focus on correct form to prevent injuries.',
    'Stretch after exercising to promote flexibility.',
    'Adequate sleep is essential for recovery.',
    'Set achievable small goals to stay motivated.',
    'Enjoy your workouts and avoid putting too much pressure on yourself.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tips'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: workoutTips.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              workoutTips[index],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          );
        },
      ),
      backgroundColor: const Color(0xFFF5F2EF),
    );
  }
}
