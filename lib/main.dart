import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/anuncioModel.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'anuncioDetalles.dart';

const baseUrl = 'http://cordobaweb.com/app/';
//const baseImagesUrl = 'https://image.tmdb.org/t/p/';
//const apiKey = "3d45a6d3bb11bab74f40da72652554da";

const datosAnuncios = '${baseUrl}datosAnuncio.php?ID=';

const baseImg = 'http://cordobaweb.com/app/imgAnuncio/';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Garaje',
      theme: ThemeData.dark(),
      home: MyMovieApp(),
    ));

class MyMovieApp extends StatefulWidget {
  @override
  _MyMovieApp createState() => new _MyMovieApp();
}

class _MyMovieApp extends State<MyMovieApp> {
  Anuncio mejoresOfertas;
  Anuncio talleres;
  Anuncio repuestos;
  Anuncio lubricentro;

  int heroTag = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _construirListaMejoresOfertas();
    _contruirListaTalleres();
    _construirListaRepuestos();
    _construirListalubricentro();
  }

  void _construirListaMejoresOfertas() async {
    var id = '${datosAnuncios}1';
    var response = await http.get(id);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      mejoresOfertas = Anuncio.fromJson(decodeJson);
    });
  }

  void _contruirListaTalleres() async {
    var id = '${datosAnuncios}2';
    var response = await http.get(id);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      talleres = Anuncio.fromJson(decodeJson);
    });
  }

  void _construirListaRepuestos() async {
    var id = '${datosAnuncios}4';
    var response = await http.get(id);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      repuestos = Anuncio.fromJson(decodeJson);
    });
  }

  void _construirListalubricentro() async {
    var id = '${datosAnuncios}3';
    var response = await http.get(id);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      lubricentro = Anuncio.fromJson(decodeJson);
    });
  }

  Widget _buildCarouselSlider() => CarouselSlider(
        items: mejoresOfertas == null
            ? <Widget>[Center(child: CircularProgressIndicator())]
            : mejoresOfertas.datos
                .map((movieItem) => _buildMovieItem(movieItem))
                .toList(),
        autoPlay: true,
        height: 240.0,
        viewportFraction: 0.5,
        enlargeCenterPage: true,
      );

  Widget _buildMovieItem(Datos movieItem) {
    movieItem.heroTag = heroTag;
    heroTag += 1;
    return Material(
        elevation: 15.0,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnuncioDetalles(dat: movieItem)));
            },
            child: Hero(
              tag: heroTag,
              child: Image.network("$baseImg${movieItem.img}",
                  //"${baseImagesUrl}w342${movieItem.posterPath}",
                  fit: BoxFit.cover),
            )));
  }

  Widget _buildMovieListItem(Datos movieItem) => Material(
          child: Container(
        width: 128.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(6.0),
                child: _buildMovieItem(movieItem)),
            Padding(
              padding: EdgeInsets.only(left: 6.0, top: 2.0),
              child: Text(
                "${movieItem.nomLocal}",
                style: TextStyle(fontSize: 14.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 6.0, top: 2.0),
                child: Text(
                  DateFormat("'Vence:' M/yyyy")
                      .format(DateTime.parse(movieItem.vencimiento)),
                  style: TextStyle(fontSize: 8.0),
                ))
          ],
        ),
      ));

  Widget _buildMoviesListView(Anuncio anuncio, String movieListTitle) =>
      Container(
        height: 258.0,
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 7.0, bottom: 7.0),
              child: Text(
                movieListTitle,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]),
              ),
            ),
            Flexible(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: anuncio == null
                  ? <Widget>[Center(child: CircularProgressIndicator())]
                  : anuncio.datos
                      .map((movieItem) => Padding(
                            padding: EdgeInsets.only(left: 6.0, right: 2.0),
                            child: _buildMovieListItem(movieItem),
                          ))
                      .toList(),
            ))
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'My Garaje 1',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ]),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text('Mejores Ofertas',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              expandedHeight: 290.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        "${baseImg}fondo.jpg",
                        fit: BoxFit.cover,
                        width: 1000.0,
                        colorBlendMode: BlendMode.dstATop,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: _buildCarouselSlider())
                  ],
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: <Widget>[
            _buildMoviesListView(talleres, 'Ofertas de Talleres Mecánicos'),
            _buildMoviesListView(repuestos, 'Ofertas en Repustos'),
            _buildMoviesListView(lubricentro, 'Ofertas en Lubricentros'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightBlue,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
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
        ],
      ),
    );
  }
}
