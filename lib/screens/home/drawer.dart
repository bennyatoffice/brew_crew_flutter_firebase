import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 10.0),
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                'Benny Thazhutha',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        FlatButton.icon(
            onPressed: () async {},
            icon: Icon(Icons.person),
            label: Text(
              "Profile",
              style: TextStyle(fontSize: 20.0),
            )),
        FlatButton.icon(
            onPressed: () async {},
            icon: Icon(Icons.free_breakfast),
            label: Text(
              "Coffee",
              style: TextStyle(fontSize: 20.0),
            )),
        FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text(
              "Logout",
              style: TextStyle(fontSize: 20.0),
            )),
      ],
    );
  }
}
