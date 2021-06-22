import 'package:flutter/material.dart';
import 'package:newsapp/models/news.dart';

class DetailedNews extends StatelessWidget {
  News newsObject;
  DetailedNews(this.newsObject, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(newsObject.title),
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
                image: this.newsObject.urlToImage == null
                    ? AssetImage('images/ina.jpg')
                    : NetworkImage(this.newsObject.urlToImage)),
            // Image.network(this.newsObject.urlToImage == null
            //     ? 'Image is not Available'
            //     : this.newsObject.urlToImage),
            Text(
                this.newsObject.desc == null
                    ? 'Error in Showing Detailed News'
                    : this.newsObject.desc,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    wordSpacing: 0.2)),
            Text(
              this.newsObject.publishedAt == null
                  ? 'Error in Showing Date of Publishing'
                  : this.newsObject.publishedAt,
              style: TextStyle(color: Colors.blueGrey),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
