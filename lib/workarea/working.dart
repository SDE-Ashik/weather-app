class Student {
  String? name;
  String? Course;
  String? id;
  String? address;
  int? status;
  Student({this.id, this.name, this.Course, this.status, this.address});
  // dart <----- json
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json["id"],
      name: json["name"],
      Course: json["course"],
      address: json["address"],
      status: json["status"]
    );
  }
}
