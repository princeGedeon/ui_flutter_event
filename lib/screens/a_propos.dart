import 'package:flutter/material.dart';
import 'package:ui_event_app/components/global.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos'),
      backgroundColor: myBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Godwin KANLINSOU',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Pascal DEGLA',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Gédéon GUEDJE',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Esther AHOSSI',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Ronald KOMAVO',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Élisée de-SOUZA',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Harold BEHETON',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/img/logo.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Ajmal ASSOUMA',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Développeur d\'applications mobiles',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contactez-moi:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
