import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants.dart';
import '../Screens/HomeScreen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.white70, Colors.blueGrey],
            )),
            child: UserAccountsDrawerHeader(
              accountName: Text(
                'Hardik Sharma',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('hardiksharma@loginid.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: AssetImage(Constants.displayPicturePath),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsHeadlines(),
                  ));
            },
            child: ListTile(
              title: Text('News Headlines'),
              // leading: Icon(Icons.article_outlined),
              leading: Image.asset(Constants.newspaperIcon),
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
