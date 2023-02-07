

class EventModel{
  int id;
  String title;
  String? description;
  String? date;
  String preview;
  String? type;
  String? code_adhesion;
  String? price;
  String start_date;
  String? end_date;
  String? end_date_inscription;
  String? status;
  String? location;
  String? number_phone;
  double? latitude;
  double? longitude;
  bool is_active;
  int category;
  int owner;
  List<dynamic> guests;

  EventModel({
    required this.id,
      required this.title,
      required this.description,
    required this.date,
    required this.preview,
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
      "date": this.date,
      "previewUrl": this.preview,
      "type": this.type,
      "code_adhesion": this.code_adhesion,
      "price": this.price,
      "start_date": this.start_date,
      "end_date": this.end_date,
      "end_date_inscription": this.end_date_inscription,
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
      date: json["date"],
      preview: json["preview"],
      type: json["type"],
      code_adhesion: json["code_adhesion"],
      price: json["price"],
      start_date: json["start_date"],
      end_date: json["end_date"],
      end_date_inscription: json["end_date_inscription"],
      status: json["status"],
      location: json["location"],
      number_phone: json["number_phone"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      is_active: json["is_active"],
      category: json["category"],
      owner: json["owner"],
      guests: json["guests"],
    );
  }
//

}