import 'package:flutter/material.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/utils/constants.dart';

class DetailedNews extends StatelessWidget {
  final News newsObject;
  DetailedNews(this.newsObject, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(Constants.newsIcon),
        // title: Center(
        //     child: Text(
        //   '--- NEWS ---',
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // )),
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                  this.newsObject.title == null
                      ? 'NO Title Available'
                      : this.newsObject.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 0.2)),
            ),

            Image(
                image: this.newsObject.urlToImage == null
                    ? AssetImage('assets/images/ina.jpg')
                    : NetworkImage(this.newsObject.urlToImage)),
            // Image.network(this.newsObject.urlToImage == null
            //     ? 'Image is not Available'
            //     : this.newsObject.urlToImage),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
              child: Text(
                  this.newsObject.desc == null
                      ? 'NO Detailed News Available'
                      : this.newsObject.desc,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5)),
            ),
            Text(
              this.newsObject.publishedDt == null
                  ? 'Error in Showing Date of Publishing'
                  : this.newsObject.publishedDt,
              style: TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
