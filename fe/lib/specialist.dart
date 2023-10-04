class Specialist{
  final int id;
  final String email;
  final String fname;
  final String lname;
  final String specialty;
  final String location;
  final String cell;

  const Specialist({
    required this.id,
    required this.email,
    required this.fname,
    required this.lname,
    required this.specialty,
    required this.location,
    required this.cell
  });

  factory Specialist.fromJson(Map<String, dynamic>json){
    return Specialist(
      id: json['id'],
      email: json['email'],
      fname: json['fname'],
      lname: json['lname'],
      specialty: json['specialty'],
      location: json['location'],
      cell: json['cell'],
    );
  }
}


/**
 * "idprofessional": 1,
    "email": "profg@gmail.com",
    "fname": "Stephan",
    "lname": "Grunner",
    "specialty": "Physio",
    "location": "Manchester, United Kingdom",
    "cell": "072 252 3698"
 */
