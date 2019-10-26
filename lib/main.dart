import 'package:flutter/material.dart';
import 'package:migaraje/talleresMap.dart';
import 'package:migaraje/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Garaje',
      home: MyApp()
));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePublicidad(),
    TalleresMap(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),  
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.lightBlue,
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Ofertas'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build),
                title: Text('Talleres'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.opacity),
                title: Text('Lubricentro'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_car_wash),
                title: Text('Lavaderos'),
              ),
            ]),
      ),
    );
  }
}
