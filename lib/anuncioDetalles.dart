import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/anuncioModel.dart';
import 'package:intl/intl.dart';

const baseUrl = 'http://cordobaweb.com/app/detalles.php?ID=';

//const anuncioUrl = 'http://cordobaweb.com/app/consulta.php';
const baseImg = 'http://cordobaweb.com/app/imgAnuncio/';

class AnuncioDetalles extends StatefulWidget {
  final Datos dat;
  AnuncioDetalles({this.dat});
  @override
  _AnuncioDetalles createState() => new _AnuncioDetalles();
}

class _AnuncioDetalles extends State<AnuncioDetalles> {
  int heroTag = 0;
  Anuncio detalle;
  String anuncioDetallesUrl;
  AnuncioDetalles anuncioDetalles;
  @override
  initState() {
    super.initState();
    anuncioDetallesUrl = '$baseUrl${widget.dat.idAnuncio}';
    _contruirListaDetalles();
  }

  void _contruirListaDetalles() async {
    var response = await http.get(anuncioDetallesUrl);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      detalle = Anuncio.fromJson(decodeJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    //heroTag += 1;
    final moviePoster = Container(
        height: 350.0,
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Center(
            child: Card(
                elevation: 15.0,
                child: Hero(
                  tag: widget.dat.heroTag,
                  child: Image.network(
                    "$baseImg${widget.dat.img}",
                    fit: BoxFit.cover,
                  ),
                ))));
    final movieTitle = Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
      child: Center(
          child: Text(
        '${widget.dat.titulo}',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      )),
    );
    final movieTickets = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        detalle == null
            ? CircularProgressIndicator()
            : Text(
              widget.dat.descripcion,
              style: TextStyle(fontSize: 11.0),
              ),
        Container(
          height: 20.0,
          width: 2.0,
          color: Colors.white70,
        ),
        Text(
          "Dirección : ${widget.dat.direccion} ", 
          style: TextStyle(fontSize: 11.0),
        ),
        RaisedButton(
          shape: StadiumBorder(),
          elevation: 15.0,
          color: Colors.red[700],
          child: Text('Adquirir'),
          onPressed: () {},
        )
      ],
    );

/*    final genresList = Container(
      height: 25.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: movieDetails == null ? [] : movieDetails.genres.map((g) => Padding( 
          padding: const EdgeInsets.only(right: 6.0),
          child: FilterChip(
          backgroundColor: Colors.grey[600],
          labelStyle: TextStyle(fontSize: 10.0),
          label: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(g.name),
          ),
          onSelected: (b){},
        ),
        )).toList(),
      ));*/

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Detalles de la Oferta',
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          moviePoster,
          movieTitle,
          movieTickets,
          
        ],
      ),
    );
  }
}
