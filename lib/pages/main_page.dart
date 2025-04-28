import 'package:flutter/material.dart';
import 'home_page.dart';
import 'set_goal_page.dart';
import 'workout_tips_page.dart';
import 'calculate_bmi_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  String? goalSummary;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      SetGoalPage(
        goalSummary: goalSummary,
        onGoalSaved: (newGoal) {
          setState(() {
            goalSummary = newGoal;
          });
        },
      ),
      const WorkoutTipsPage(),
      const CalculateBMIPage(),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goal'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Tips'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'BMI'),
        ],
      ),
    );
  }
}
