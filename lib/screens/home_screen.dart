import 'package:flutter/material.dart';
import 'package:flutter_ui/configuration.dart';
import 'package:flutter_ui/screens/screen_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool homeScreenIsFullSize = true;

  @override
  Widget build(BuildContext context) {
    // we can us animated container
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: homeScreenIsFullSize
            ? BorderRadius.circular(0)
            : BorderRadius.circular(40),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    homeScreenIsFullSize ? Icons.menu : Icons.arrow_back_ios,
                    size: 40,
                  ),
                  onPressed: () {
                    if (homeScreenIsFullSize == true) {
                      setState(() {
                        xOffset = 230;
                        yOffset = 200;
                        scaleFactor = 0.6;
                        homeScreenIsFullSize = false;
                      });
                    } else {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        homeScreenIsFullSize = true;
                      });
                    }
                  },
                ),
                Column(
                  children: <Widget>[
                    Text('location'),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: primaryGreen,
                        ),
                        Text('Hyderabad, Telenghana'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/parrot.png'),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(
              top: 30.0,
              left: 20.0,
              right: 20.0,
              bottom: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                Text('Search pet to adopt'),
                Icon(Icons.settings),
              ],
            ),
          ),
          Container(
            height: 140,
            color: Colors.grey[200],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadowList,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          categories[index]['iconPath'],
                          height: 60.0,
                          width: 55.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        categories[index]['name'],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen2(
                    catAge: '2 years old',
                    location: 'Hyderabad Telanghana',
                    catBreed: 'Abyssinion cat',
                    nameOfCat: 'Sola',
                    catImageUrl: 'images/pet-cat2.png',
                    heroTagId: 1,
                  ),
                ),
              );
            },
            child: Description(
              tileColor: Colors.blueGrey[300],
              imageUrl: 'images/pet-cat2.png',
              title: 'Sola',
              subTitle: 'Abyssinian cat',
              age: '2 years old',
              distance: 'Distance: 3.6 km',
              heroTagNumber: 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen2(
                    catAge: '1.5 years old',
                    location: 'Srinagar Jammu',
                    catBreed: 'Abyssinion cat',
                    nameOfCat: 'Orion',
                    catImageUrl: 'images/pet-cat1.png',
                    heroTagId: 2,
                  ),
                ),
              );
            },
            child: Description(
              tileColor: Colors.orange[300],
              imageUrl: 'images/pet-cat1.png',
              title: 'Orion',
              subTitle: 'Abyssinian cat',
              age: '1.5 years old',
              distance: 'Distance: 7.6 km',
              heroTagNumber: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  final Color tileColor;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String age;
  final String distance;
  final int heroTagNumber;
  Description({
    this.tileColor,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.age,
    this.distance,
    this.heroTagNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  //margin applies only to the container.
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: shadowList,
                  ),
                ),
                Align(
                  child: Hero(tag: heroTagNumber, child: Image.asset(imageUrl)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 62, bottom: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(FontAwesomeIcons.mars),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      age,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        Text(
                          distance,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
