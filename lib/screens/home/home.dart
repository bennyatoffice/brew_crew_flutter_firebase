import 'package:brew_crew/screens/home/drawer.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:brew_crew/models/brew.dart';

import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        // backgroundColor: Colors.brown[50],
        // appBar: AppBar(
        //   title: Text('Brew Crew'),
        //   backgroundColor: Colors.brown[400],
        //   elevation: 0.0,
        //   actions: <Widget>[
        //     FlatButton.icon(
        //         onPressed: () async {
        //           await _auth.signOut();
        //         },
        //         icon: Icon(Icons.person),
        //         label: Text("Logout")),
        //     FlatButton.icon(
        //         onPressed: () => _showSettingsPanel(),
        //         icon: Icon(Icons.settings),
        //         label: Text('Settings'))
        //   ],
        // ),
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 0.0, left: 20.0),
                            child: Text(
                              'Welcome',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 20.0),
                            child: Text(
                              'Benny Thazhutha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Drawer Pressed');
                              Scaffold.of(context).openDrawer();
                            },
                            child: Container(
                              width: 62.0,
                              height: 62.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(31.0, 31.0)),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(-1, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(42.0, 42.0),
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(10.0, 10.0)),
                                color: const Color(0xfff55252),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffffffff)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: BrewList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
