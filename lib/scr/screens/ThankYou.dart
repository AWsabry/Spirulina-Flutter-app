import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/screens/home.dart';
import 'package:food_course/scr/widgets/custom_text.dart';

class ThankYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("شكرًا لك"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              changeScreen(context, Home());
            },
          ),
        ],
      ),
      body: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Image.asset(
                'assets/images/tick.png',
                height: 150,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'شكرًا لك',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      " ..شكرًا على زيارتك لنا ، نتمنى ان نكون عند حسن ظنك دائمًا",
                      style: TextStyle(
                        color: grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                    "في انتظار زيارتك لنا مرة أخرى",
                    style: TextStyle(
                      color: grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
