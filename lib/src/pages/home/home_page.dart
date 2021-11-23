import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/configs/app_setting.dart';
import 'package:mini_project/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> images = [
    'https://www.homezoomer.com/wp-content/uploads/2018/08/Episode-%E0%B8%9E%E0%B8%AB%E0%B8%A5%E0%B9%82%E0%B8%A2%E0%B8%98%E0%B8%B4%E0%B8%99-%E0%B8%AA%E0%B8%B0%E0%B8%9E%E0%B8%B2%E0%B8%99%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88_G-60.jpg',
    'https://s3-ap-southeast-1.amazonaws.com/o77site/xt-huai-khwang-condominium-portrait-810x890.jpg',
    'https://pix10.agoda.net/hotelImages/157/1575192/1575192_16101913560047918848.jpg?s=1024x768',
    'https://assets.brandinside.asia/uploads/2020/12/shutterstock_1500470186-scaled.jpg',
    'https://asset.pf.co.th/project-location/thumbnail/bbaf472f4671eb81.jpg',
    'https://www.manadevelopment.co.th/storage/app/files/1/projects/AspenA/AspenA_PC.jpg',
    'https://decor.mthai.com/app/uploads/2017/03/800_thumbnail_condo_salaya_decor_mthai.jpg',
  ];
  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://www.168tobedesign.co.th/wp-content/uploads/2021/01/Images-3-5-1024x768.jpg",
      "title": "Painting Studio",
      "description":
      "You need a creative space ready for your art? We got that covered.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
      "https://www.banidea.com/wp-content/uploads/2019/01/condo-decor.jpg",
      "title": "Art Gallery",
      "description":
      "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
      "https://www.forfur.com/img/I73/t_7277_15470230131494342763.jpg",
      "title": "Video Services",
      "description":
      "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];
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
                style: TextStyle(color: Colors.black87),),
              accountEmail: Text('624235025@parichat.skru.ac.th',style: TextStyle(color: Colors.black87),),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
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
                Icons.logout,
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
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(images[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, item["page"]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Text(item["price"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.deepOrange)),
                            Text(item["title"],
                                style:
                                TextStyle(fontSize: 32, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 8),
                              child: Text(
                                item["description"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.deepOrange),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
} //end class
