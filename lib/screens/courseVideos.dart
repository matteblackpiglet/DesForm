import 'package:DesForm/screens/videoPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:DesForm/heading.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// ignore: must_be_immutable
class CourseVideos extends StatefulWidget {
  CourseVideos({this.course});

  DocumentSnapshot course;

  @override
  _CourseVideosState createState() => _CourseVideosState();
}

class _CourseVideosState extends State<CourseVideos> {
  Razorpay _razorpay;
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Container(
          decoration: (BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorLight
              ],
            ),
          )),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
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
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: scaler.getHeight(0.5)),
                                  Heading(
                                    text: widget.course['name'],
                                    color: Colors.white,
                                    weight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: scaler.getHeight(0.5),
                                  ),
                                  RaisedButton(
                                    onPressed: openCheckout,
                                    color: Theme.of(context).accentColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Text(
                                      "Enroll Now".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat',
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
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
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      'assets/images/coursePage.png',
                      scale: scaler.getWidth(0.56),
                    ),
                  ),
                ],
              ),
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
                      stream: widget.course.reference
                          .collection('videos')
                          .orderBy('lesson')
                          .snapshots(),
                      builder: (context, snapshot) {
                        // stream to access course vids directory.
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
                                video: video,
                                course: widget.course,
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

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_qwqu1Y5ZI4Ogby',
      'amount': widget.course['price'] * 100,
      'name': 'DesForm',
      'description': 'Enrollment fee for ${widget.course['name']} course',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Error");
    print(response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    print(response.walletName);
  }
}

//build the vid bar
class VideoBar extends StatefulWidget {
  const VideoBar({this.video, this.course});

  final DocumentSnapshot video;
  final DocumentSnapshot course;

  @override
  _VideoBarState createState() => _VideoBarState();
}

class _VideoBarState extends State<VideoBar>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  FirebaseUser user;
  String userEmail;

  _loadUser() async {
    user = await FirebaseAuth.instance.currentUser();
    userEmail = user.email;
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    final double width = MediaQuery.of(context).size.width;
    _loadUser();

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform(
            transform:
                Matrix4.translationValues(animation.value * width, 0.0, 0.0),
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
                        child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('users')
                                .where('email', isEqualTo: userEmail)
                                .getDocuments()
                                .asStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var user = snapshot.data.documents[0];

                                return RaisedButton(
                                  color: Colors.grey[200],
                                  disabledColor: Colors.grey[400],
                                  onPressed: (widget.video['lesson'] == 0 ||
                                          user['courses'].contains(
                                              widget.course['code'].toString()))
                                      ? () => Navigator.of(context)
                                          .push(_createRoute(widget.video))
                                      : null,
                                  padding: EdgeInsets.all(0.0),
                                  splashColor: Color(0xffe6e5f5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  animationDuration:
                                      Duration(milliseconds: 200),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.grey[600],
                                  ),
                                );
                              }
                              return Container(height: 0.0, width: 0.0);
                            }),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Lesson ${widget.video['lesson']}",
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
                              widget.video['title'],
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
                            "${widget.video['dur']} mins",
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
        });
  }
}

Route _createRoute(DocumentSnapshot vid) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        VideoPage(video: vid),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
