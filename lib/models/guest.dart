import 'package:ui_event_app/models/user.dart';

class EventGuest{
  int id;
  String title;
  List<User> guests;

  EventGuest({required this.id, required this.title,required this.guests});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'guests': this.guests,
    };
  }

  factory EventGuest.fromMap(Map<String, dynamic> map) {
    return EventGuest(
      id: map['id'] as int,
      title: map['title'] as String,
      guests: map['guests'] as List<User>,
    );
  }
}