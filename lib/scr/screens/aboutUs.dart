import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/style.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("من نحن"),
        backgroundColor: green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                "assets/images/logoApp.jpeg",
                width: 250,
                height: 250,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'تطبيق العطار هو منصة إلكترونية عالمية تهتمُ بكم، وتقدم منتجات عُشبيه وبهارات وبقوليات ومكسرات وزيوت طبيعيه وانواع العسل الطبيعيه وكذلك ارقى منتجات التمور المحليه من أميزِ العلامات التجارية العالمية والمحلية، منتجات العطار يتم إختيارها بجوده عاليه وبواسطة معاييرخاصه من قبل مختصين في المجال. وتُقَّدمُ لكم بأسعارٍ مميزة ومُنافسة.نسعى للتطور دائماً وبنقدكم نرتقي ونبقى💌وهنوصلك فين ماتكون الشحن لجميع المحافظات 📍',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: green),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Icon(
                          Icons.alternate_email,
                          color: green,
                          size: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'for Business inquires',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'spirulina.data@gmail.com',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.phone,
                          color: green,
                          size: 40,
                        ),
                        Text('للتواصل'),
                        Text(
                          '+20 102 222 1084',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.location_on,
                          color: green,
                          size: 40,
                        ),
                        Text('العنوان'),
                        Text(
                          '١٠٠ شارع مصطفى النحاس مدينة نصر',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text('Copyright © عطارة أونلاين , All rights reserved')
          ],
        ),
      ),
    );
  }
}
