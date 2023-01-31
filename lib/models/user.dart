class User{
  int id;
  String nom;
  String prenom;
  String email;
  String type="";


  User({required this.id, required this.nom,required this.prenom,required this.email,required this.type});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "nom": this.nom,
      "prenom": this.prenom,
      "email": this.email,
      "type": this.type,
    };
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(id: int.parse(json["id"]),
      nom: json["nom"],
      prenom: json["prenom"],
      email: json["email"],
      type: json["type"],);
  }



}