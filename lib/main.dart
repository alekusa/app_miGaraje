import 'package:flutter/material.dart';
import 'package:migaraje/talleresMap.dart';
import 'package:migaraje/home.dart';

void main() => runApp(MyApp());

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
      
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('My Garaje'),
        // ),
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
                icon: Icon(Icons.build),
                title: Text('Talleres'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Repuestos'),
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
