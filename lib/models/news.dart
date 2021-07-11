import 'package:intl/intl.dart';

class News {
  String title;
  String desc;
  String urlToImage;
  String publishedAt;
  String get publishedDt {
    var formatted =
        DateFormat.yMMMMd().add_jm().format(DateTime.parse(publishedAt));
    // print(formatted);
    return formatted;
  }

  News(this.title, this.desc, this.urlToImage, this.publishedAt);
}
