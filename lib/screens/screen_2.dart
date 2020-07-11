import 'package:flutter/material.dart';
import 'package:flutter_ui/configuration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen2 extends StatelessWidget {
  final String nameOfCat;
  final String catBreed;
  final String location;
  final String catAge;
  final String catImageUrl;
  final int heroTagId;

  Screen2({
    this.catAge,
    this.catBreed,
    this.location,
    this.nameOfCat,
    this.catImageUrl,
    this.heroTagId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[300],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      print('share button pressed');
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: heroTagId,
                child: heroTagId == 1
                    ? Image.asset(catImageUrl)
                    : Image.asset(
                        catImageUrl,
                        height: 400.0,
                        width: 300,
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 140.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          nameOfCat,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.mars,
                          color: Colors.grey,
                          size: 30.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(catBreed),
                        Text(catAge),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Text(
                          location,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 70.0,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'Adoption',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 190.0),
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              height: 150.0,
              // color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: CircleAvatar(),
                    title: Text('Umakanth pendyala'),
                    subtitle: Text('owner'),
                    trailing: Text('11 jun 2020'),
                  ),
                  Text(
                    'My work includes working in abroad and I need some one who can take care of the cat, Provide shelter...',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
