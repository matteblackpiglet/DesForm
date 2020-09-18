import 'package:DesForm/screens/courseVideos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";

  DocumentSnapshot course;

  @override
  Widget build(BuildContext context) {
    // ScreenScaler scaler = new ScreenScaler();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Card(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                style: TextStyle(
                  fontFamily: 'Montserrat',
                )),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? Firestore.instance
                .collection('courses')
                .where("searchKeywords", arrayContains: name)
                .snapshots()
            : Firestore.instance.collection("courses").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];

                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: Text(data['name'],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            )),
                        onTap: () {
                          Navigator.of(context).push(_createRoute(data));
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

Route _createRoute(DocumentSnapshot c) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        CourseVideos(course: c),
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
