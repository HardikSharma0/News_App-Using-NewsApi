import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/widgets/customdrawer.dart';
import '../models/news.dart';
import '../utils/server.dart';
import '../Screens/detailedNews.dart';
import '../utils/constants.dart';

class NewsHeadlines extends StatefulWidget {
  @override
  _NewsHeadlinesState createState() => _NewsHeadlinesState();
}

class _NewsHeadlinesState extends State<NewsHeadlines> {
  List<News> news = [];
  storeNewsData() async {
    Response<dynamic> response = await Server.getHeadlines();
    Map<String, dynamic> map = response.data;
    List<dynamic> list = map['articles'];
    news = list
        .map((dynamic currentNews) => new News(
            currentNews['title'],
            currentNews['description'],
            currentNews['urlToImage'],
            currentNews['publishedAt']))
        .toList();
  }

  showDetailedNews(String title) {
    int index = news.indexWhere((News currentNews) {
      String currentTitle = currentNews.title;
      return currentTitle.contains(title);
    });

    if (index != -1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (cntxt) => DetailedNews(news[index])));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeNewsData();
    // print('Server Call');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text('Headlines', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        // actionsIconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.live_tv),
            onPressed: () {},
            color: Colors.black,
            splashColor: Colors.white24,
          )
        ],
      ),
      body: Container(
          child: FutureBuilder(
        future: Server.getHeadlines(),
        builder:
            (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
          if (snapshot.hasData == true &&
              snapshot.connectionState == ConnectionState.done) {
            // print(
            //     "|||||||snapshot has data|||| ${snapshot.data.data['articles']}");
            // dynamic articles = snapshot.data.data['articles'];
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(6),
                  child: ListTile(
                    onTap: () {
                      showDetailedNews(news[index].title);
                    },
                    title: Text(news[index].title == null
                        ? 'No News Available'
                        : news[index].title),
                    leading: news[index].urlToImage == null
                        ? Image.asset(Constants.imageNotAvailable)
                        : Image.network(
                            news[index].urlToImage,
                            fit: BoxFit.fill,
                          ),
                    subtitle: Text(news[index].publishedDt == null
                        ? ''
                        : news[index].publishedDt),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Center(
                child: Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ));
          }
        },
      )),
    );
  }
}
