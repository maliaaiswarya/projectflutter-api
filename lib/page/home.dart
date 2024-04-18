import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
     
        '/setting': (context) => SettingPage(),
        '/longlist': (context) => LonglistPage(),
      },
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Resep Makanan khas bali'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ResepCard(
            title: "Ayam Betutu Khas Bali",
            rating: "4.9",
            cookTime: "30 min",
            thumbnailUrl: "https://asset.kompas.com/crops/czscp0bAyvfpuoYNGG2H2ivl9tU=/32x22:1000x667/750x500/data/photo/2022/02/28/621c6dd3e732b.jpg",
          );
        },
        
      ),
    drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Malia Aiswarya"),
              accountEmail: Text("maliaaiswarya@gmail.com"),
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pinimg.com/564x/c5/ec/52/c5ec52d3afb7835851bf583481a731ba.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/setting');
              },
              child: ListTile(
                title: Text('Setting'),
                trailing: Icon(Icons.settings),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/longlist');
              },
              child: ListTile(
                title: Text('longlist'),
                trailing: Icon(Icons.list),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResepCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  const ResepCard({
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        rating,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.access_time, color: Colors.white),
                      Text(
                        cookTime,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: Text('Setting Page'),
      ),
    );
  }
}



class LonglistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('history'),
      ),
      body: Center(
        child: Text('Longlist Page'),
      ),
    );
  }
}
