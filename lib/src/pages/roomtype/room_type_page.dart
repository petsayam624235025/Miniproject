import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/configs/app_setting.dart';
import 'package:mini_project/src/pages/apartment/apartment_page.dart';
import 'package:mini_project/src/pages/condo/condo_page.dart';
import 'package:mini_project/src/pages/dormitory/dormitory_page.dart';
import 'package:mini_project/src/pages/mansion/mansion_page.dart';
import 'package:mini_project/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomtypePage extends StatefulWidget {
  @override
  _RoomtypePageState createState() => _RoomtypePageState();
}

class _RoomtypePageState extends State<RoomtypePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/mad.jpg'),
              ),
              accountName: Text('Petsayam  Kanchaing',
                style: TextStyle(color: Colors.white),),
              accountEmail: Text('624235025@parichat.skru.ac.th',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'ประเภทห้องเช่า',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CondoPage()));
                  },
                  child: Container(
                    width: 100,
                    height: 70,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/condoooo.png'),
                          scale: 1),
                    ),
                  ),
                ),
                Text(
                  'คอนโดมิเนียม',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApartmentPage()));
                  },
                  child: Container(
                    width: 100,
                    height: 70,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/apartmenttt.png'),
                          scale: 1),
                    ),
                  ),
                ),
                Text(
                  'อพาร์ทเมนท์',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MansionPage()));
                  },
                  child: Container(
                    width: 100,
                    height: 70,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/mansionnn.png'),
                          scale: 1),
                    ),
                  ),
                ),
                Text(
                  'แมนชั่น',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => dormitory()));
                  },
                  child: Container(
                    width: 100,
                    height: 70,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/dormitoryyy.png'),
                          scale: 1),
                    ),
                  ),
                ),
                Text(
                  'หอพัก',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
} //end class

