import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() => runApp(MaterialApp(home: Player()));

class Player extends StatelessWidget {
  @override
  ScreenScaler scaler = new ScreenScaler();

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: (BoxDecoration(color: Color(0xfff5f4e))),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f4ef),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://png.pngtree.com/png-vector/20200428/ourlarge/pngtree-people-who-work-on-computers-run-out-of-ideas-png-image_2195280.jpg'),
                    alignment: Alignment.topRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.chevron_left),
                              Icon(Icons.more_vert)
                            ],
                          ),
                          SizedBox(height: 10),
                          ClipPath(
                            child: Container(
                                color: Colors.amberAccent,
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, right: 20, bottom: 5),
                                child: Text(
                                  "DesForm".toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          SizedBox(height: scaler.getHeight(0.5)),
                          Text(
                            "Python",
                            style: TextStyle(
                              fontSize: scaler.getTextSize(9.6),
                            ),
                          ),
                          SizedBox(
                            height: scaler.getHeight(0.5),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.group),
                              SizedBox(width: scaler.getWidth(0.3)),
                              Text("1.5K"),
                              SizedBox(
                                width: scaler.getWidth(1),
                              ),
                              Icon(Icons.star),
                              SizedBox(
                                width: scaler.getWidth(0.3),
                              ),
                              Text("4.8")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: scaler.getHeight(2),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: scaler.getHeight(0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Course Videos",
                          style: TextStyle(
                            fontSize: scaler.getTextSize(7.6),
                            fontFamily: 'montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff5555B7),
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
                          child: ButtonTheme(
                            buttonColor: Colors.grey[300],
                            height: 40,
                            minWidth: 92,
                            child: RaisedButton(
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              elevation: 4.0,
                              animationDuration: Duration(milliseconds: 200),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "See All",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 11,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaler.getHeight(0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                minWidth: 40),
                            child: RaisedButton(
                              color: Colors.grey[400],
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Color(0xffe6e5f5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration: Duration(milliseconds: 200),
                              child: Icon(Icons.play_arrow),
                            )),
                        SizedBox(
                          width: scaler.getWidth(1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lesson 1",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                            Text(
                              "quick brown fox",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: scaler.getWidth(8),
                        ),
                        Text(
                          "5.13 mins",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaler.getHeight(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                minWidth: 40),
                            child: RaisedButton(
                              color: Colors.grey[400],
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Color(0xffe6e5f5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration: Duration(milliseconds: 200),
                              child: Icon(Icons.play_arrow),
                            )),
                        SizedBox(
                          width: scaler.getWidth(1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lesson2",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: "Montserrat",
                              ),
                            ),
                            Text(
                              "quick brown fox",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: scaler.getWidth(8),
                        ),
                        Text(
                          "5.13 mins",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaler.getHeight(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                minWidth: 40),
                            child: RaisedButton(
                              color: Colors.grey[400],
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Color(0xffe6e5f5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration: Duration(milliseconds: 200),
                              child: Icon(Icons.play_arrow),
                            )),
                        SizedBox(
                          width: scaler.getWidth(1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lesson 3",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                            Text(
                              "quick brown fox",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: scaler.getWidth(8),
                        ),
                        Text(
                          "5.13 mins",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaler.getHeight(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 40,
                            constraints: BoxConstraints(
                                maxHeight: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                minWidth: 40),
                            child: RaisedButton(
                              color: Colors.grey[400],
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Color(0xffe6e5f5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration: Duration(milliseconds: 200),
                              child: Icon(Icons.play_arrow),
                            )),
                        SizedBox(
                          width: scaler.getWidth(1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lesson 4",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                            Text(
                              "quick brown fox",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: scaler.getWidth(8),
                        ),
                        Text(
                          "5.13 mins",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaler.getHeight(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 40,
                            constraints: BoxConstraints(
                                maxHeight: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                minWidth: 40),
                            child: RaisedButton(
                              color: Colors.grey[400],
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Color(0xffe6e5f5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration: Duration(milliseconds: 200),
                              child: Icon(Icons.play_arrow),
                            )),
                        SizedBox(
                          width: scaler.getWidth(1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lesson 5",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                            Text(
                              "quick brown fox",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: scaler.getWidth(8),
                        ),
                        Text(
                          "5.13 mins",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 40,
                            constraints: BoxConstraints(
                                maxHeight: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                minWidth: 40),
                            child: RaisedButton(
                              color: Colors.grey[400],
                              onPressed: () {},
                              padding: EdgeInsets.all(0.0),
                              splashColor: Color(0xffe6e5f5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration: Duration(milliseconds: 200),
                              child: Icon(Icons.play_arrow),
                            )),
                        SizedBox(
                          width: scaler.getWidth(1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lesson 6",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                            Text(
                              "quick brown fox",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontFamily: "montserrat"),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: scaler.getWidth(8),
                        ),
                        Text(
                          "5.13 mins",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
