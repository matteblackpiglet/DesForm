import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../heading.dart';
import '../profilePhotoPlain.dart';
import '../statusCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Profile extends StatelessWidget {
  Profile({this.so});

  final Function so;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: ProfilePage(sOut: so),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({this.sOut});

  final Function sOut;

  @override
  _ProfilePageState createState() => _ProfilePageState(signOut: sOut);
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState({this.signOut});
  final double mainCurve = 25.0;
  final Function signOut;
  FirebaseUser user;
  String userEmail;

  _loadUser() async{
    user = await FirebaseAuth.instance.currentUser();
    userEmail = user.email;
  }

  @override
  Widget build(BuildContext context) {
    _loadUser();
    ScreenScaler scaler = ScreenScaler();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: Firestore.instance.collection('users').where('email', isEqualTo: userEmail).getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return const Text('');

          return StreamBuilder(
            stream: Firestore.instance
                .collection('users')
                .where('email', isEqualTo: userEmail)
                .getDocuments()
                .asStream(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var user = snapshot.data.documents[0];
                
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Theme.of(context).primaryColorLight,
                              Theme.of(context).primaryColor
                            ]),
                      ),
                      child: SafeArea(
                        child: SizedBox(
                          height: scaler.getHeight(11.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: IconButton(
                                  icon: Icon(Icons.chevron_left),
                                  iconSize: 30.0,
                                  color: Theme.of(context).accentColor,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ProfilePhotoPlain(),
                                    Container(
                                      margin: EdgeInsets.only(left: 16.0),
                                      child: Heading(
                                        text: user['name'],
                                        color: Color(0xffffffff),
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  StatusCard(
                                    text: 'Courses Enrolled',
                                    count: user['courses'].length.toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(mainCurve),
                                topRight: Radius.circular(mainCurve)),
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 25.0,
                                spreadRadius: 1.0,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'ABOUT',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: scaler.getTextSize(8.0)),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30.0),
                                      child: Column(children: <Widget>[
                                        Tag(
                                          title: 'Name:',
                                          value: user['name'],
                                        ),
                                        Tag(
                                          title: 'DOB:',
                                          value: user['dob'],
                                        ),
                                        Tag(
                                          title: 'Email:',
                                          value: user['email'],
                                        ),
                                      ]),
                                    ),
                                  ]),
                            ),
                            GestureDetector(
                              onTap: signOut,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.exit_to_app),
                                      iconSize: 40.0,
                                      color: Theme.of(context).primaryColorLight,
                                      onPressed: signOut,
                                    ),
                                    Text(
                                      'Sign Out',
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -1.0,
                                          fontSize: scaler.getTextSize(8.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Text('');
            },
          );
        },
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({this.title, this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: scaler.getWidth(8.0),
            child: Heading(
              text: title,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            width: scaler.getWidth(19.0),
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: scaler.getTextSize(8.0)),
            ),
          ),
        ],
      ),
    );
  }
}
