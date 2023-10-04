class User {
  final int user_id;
  final String email;
  final String fname;
  final String lname;
  final int age;
  final double weight;
  final int height;
  final String location;
  final int current_exercise;
  final int   current_sleep;
  final int current_food;
  final int current_water;
  final List<dynamic> weekly_sleeping_hours;

  const User({
    required this.user_id,
    required this.email,
    required this.fname,
    required this.lname,
    required this.age,
    required this.weight,
    required this.height,
    required this.location,
    required this.current_exercise,
    required this.current_sleep,
    required this.current_food,
    required this.current_water,
    required this.weekly_sleeping_hours
  });

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      user_id: json['id'],
      email: json['email'],
      fname: json['fname'],
      lname: json['lname'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      location: json['location'],
      current_exercise: json['current_exercise'],
      current_sleep: json['current_sleep'],
      current_food: json['current_food'],
      current_water: json['current_water'],
      weekly_sleeping_hours: json['weekly_sleeping_hours']
    );
  }



}
