

class EventModel{
  int id;
  String title;
  String description;
  DateTime date;
  String previewUrl;
  String type;
  String code_adhesion;
  String price;
  DateTime start_date;
  DateTime end_date;
  DateTime end_date_inscription;
  String status;
  String location;
  String number_phone;
  double latitude;
  double longitude;
  bool is_active;
  String category;
  int owner;
  List<int> guests;

  EventModel({
    required this.id,
      required this.title,
      required this.description,
    required this.date,
    required this.previewUrl,
    required this.type,
    required this.code_adhesion,
    required this.price,
    required this.start_date,
    required  this.end_date,
    required this.end_date_inscription,
    required  this.status,
    required  this.location,
    required this.number_phone,
    required this.latitude,
    required this.longitude,
    required this.is_active,
    required this.category,
    required this.owner,
    required this.guests});

  Map<String, dynamic> toJson() {
    return {
      "id":this.id,
      "title": this.title,
      "description": this.description,
      "date": this.date.toIso8601String(),
      "previewUrl": this.previewUrl,
      "type": this.type,
      "code_adhesion": this.code_adhesion,
      "price": this.price,
      "start_date": this.start_date.toIso8601String(),
      "end_date": this.end_date.toIso8601String(),
      "end_date_inscription": this.end_date_inscription.toIso8601String(),
      "status": this.status,
      "location": this.location,
      "number_phone": this.number_phone,
      "latitude": this.latitude,
      "longitude": this.longitude,
      "is_active": this.is_active,
      "category": this.category,
      "owner": this.owner,
      "guests": this.guests,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> json) {
    return EventModel(
      id:json['id'],
      title: json["title"],
      description: json["description"],
      date: DateTime.parse(json["date"]),
      previewUrl: json["previewUrl"],
      type: json["type"],
      code_adhesion: json["code_adhesion"],
      price: json["price"],
      start_date: DateTime.parse(json["start_date"]),
      end_date: DateTime.parse(json["end_date"]),
      end_date_inscription: DateTime.parse(json["end_date_inscription"]),
      status: json["status"],
      location: json["location"],
      number_phone: json["number_phone"],
      latitude: double.parse(json["latitude"]),
      longitude: double.parse(json["longitude"]),
      is_active: json["is_active"].toLowerCase() == 'true',
      category: json["category"],
      owner: int.parse(json["owner"]),
      guests: List.of(json["guests"]).map((i) => int.parse(i)).toList(),
    );
  }
//

}