import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:DesForm/heading.dart';

// ignore: must_be_immutable
class CourseVideos extends StatelessWidget {
  CourseVideos({this.course});

  DocumentSnapshot course;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Container(
          decoration: (BoxDecoration(color: Theme.of(context).accentColor)),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    image: DecorationImage(
                      image: AssetImage('assets/images/coursePage.png'),
                      alignment: Alignment.topRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.chevron_left),
                              onPressed: () => Navigator.pop(context),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      color: Color(0xfffccc86),
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          top: 5.0,
                                          right: 10,
                                          bottom: 5),
                                      child: Text(
                                        "DesForm".toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat',
                                        ),
                                      )),
                                  SizedBox(height: scaler.getHeight(0.5)),
                                  Heading(
                                    text: course['name'],
                                    color: Colors.grey[900],
                                    weight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: scaler.getHeight(0.5),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.group),
                                      SizedBox(width: scaler.getWidth(0.3)),
                                      Text(
                                        "1.5K",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                      SizedBox(
                                        width: scaler.getWidth(1),
                                      ),
                                      Icon(Icons.star),
                                      SizedBox(
                                        width: scaler.getWidth(0.3),
                                      ),
                                      Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: scaler.getHeight(2),
                        ),
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                  color: Colors.grey[100],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: scaler.getHeight(0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Heading(
                                text: 'Course Videos',
                                color: Theme.of(context).primaryColor,
                                weight: FontWeight.w900,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder(
                      stream: course.reference
                          .collection('videos')
                          .orderBy('lesson')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text('');

                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          // ignore: missing_return
                          itemBuilder: (context, index) {
                            var video = snapshot.data.documents[index];
                            return Stack(children: <Widget>[
                              VideoBar(
                                lessonNo: video['lesson'].toString(),
                                lessonTitle: video['title'],
                                dur: video['dur'],
                              ),
                            ]);
                          },
                        );
                      },
                    ),
                    SizedBox(height: scaler.getHeight(1.0))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoBar extends StatefulWidget {
  const VideoBar({this.lessonNo, this.lessonTitle, this.dur});

  final String lessonNo, lessonTitle, dur;

  @override
  _VideoBarState createState() => _VideoBarState();
}

class _VideoBarState extends State<VideoBar> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(
      begin: -1.0,
      end: 0.0
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      )
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child){
        return Transform(
          transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                height: scaler.getHeight(3.5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 40,
                        minHeight: 40,
                        maxWidth: 40,
                        minWidth: 40,
                      ),
                      child: RaisedButton(
                        color: Colors.grey[200],
                        onPressed: () {},
                        padding: EdgeInsets.all(0.0),
                        splashColor: Color(0xffe6e5f5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        animationDuration: Duration(milliseconds: 200),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Lesson ${widget.lessonNo}",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontFamily: 'Montserrat',
                            fontSize: scaler.getTextSize(6.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: scaler.getWidth(16.0),
                          child: Text(
                            widget.lessonTitle,
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontFamily: 'Montserrat',
                              fontSize: scaler.getTextSize(7.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: scaler.getWidth(6.5),
                      margin: EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "${widget.dur} mins",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
