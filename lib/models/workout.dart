class Workout {
  String name;
  String type;
  int amount; // จำนวนครั้ง หรือ นาที
  DateTime date;

  Workout({
    required this.name,
    required this.type,
    required this.amount,
    required this.date,
  });
}
