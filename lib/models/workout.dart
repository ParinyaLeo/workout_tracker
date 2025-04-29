class Workout {
  String name;
  String type;
  int amount;
  DateTime date;

  Workout({
    required this.name,
    required this.type,
    required this.amount,
    required this.date,
  });

  // ✅ แปลงเป็น JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type,
    'amount': amount,
    'date': date.toIso8601String(),
  };

  // ✅ สร้างจาก JSON
  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    name: json['name'],
    type: json['type'],
    amount: json['amount'],
    date: DateTime.parse(json['date']),
  );
}
