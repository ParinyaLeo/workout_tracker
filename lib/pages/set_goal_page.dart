import 'package:flutter/material.dart';

class SetGoalPage extends StatefulWidget {
  final String? goalSummary;
  final Function(String) onGoalSaved;

  const SetGoalPage({
    Key? key,
    required this.goalSummary,
    required this.onGoalSaved,
  }) : super(key: key);

  @override
  State<SetGoalPage> createState() => _SetGoalPageState();
}

class _SetGoalPageState extends State<SetGoalPage> {
  final _currentWeightController = TextEditingController();
  final _targetWeightController = TextEditingController();
  final _durationController = TextEditingController();

  String? _goalSummary;

  @override
  void initState() {
    super.initState();
    _goalSummary = widget.goalSummary; // << เอาข้อมูลจากข้างนอกมาแสดง
  }

  void _saveGoal() {
    final currentWeight = double.tryParse(_currentWeightController.text);
    final targetWeight = double.tryParse(_targetWeightController.text);
    final duration = int.tryParse(_durationController.text);

    if (currentWeight != null && targetWeight != null && duration != null && duration > 0) {
      final weightDifference = (currentWeight - targetWeight).abs();
      final goal = weightDifference > 0
          ? 'Lose ${weightDifference.toStringAsFixed(1)} kg in $duration months.'
          : 'Gain ${weightDifference.toStringAsFixed(1)} kg in $duration months.';

      setState(() {
        _goalSummary = goal;
      });

      widget.onGoalSaved(goal); // ส่งข้อมูลกลับไปเก็บที่ MainPage
    } else {
      setState(() {
        _goalSummary = 'Please fill out all fields correctly.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Fitness Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Text('Current Weight (kg)', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _currentWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g., 70',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Target Weight (kg)', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _targetWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g., 65',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Duration (months)', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g., 2',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveGoal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Set Goal', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 32),
            if (_goalSummary != null) ...[
              Center(
                child: Text(
                  _goalSummary!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F2EF),
    );
  }
}
