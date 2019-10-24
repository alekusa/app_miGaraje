import 'package:flutter/material.dart';
import './models/anuncioModel.dart';
//import 'package:intl/intl.dart';

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

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.dat.heroTag = heroTag;
    //heroTag += 1;
    final imagen = Container(
        height: 350.0,
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Center(
            child: Card(
                elevation: 15.0,
                child: Hero(
                  tag: heroTag,
                  child: Image.network(
                    "$baseImg${widget.dat.img}",
                    fit: BoxFit.cover,
                  ),
                ))));
    final titulo = Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
      child: Center(
          child: Text(
        widget.dat.titulo,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      )),
    );
    final costo = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //Costo del Producto
        widget.dat.costo == null
            ? CircularProgressIndicator()
            : Text(
                r"$ " "${widget.dat.costo}",
                style: TextStyle(fontSize: 14.0),
              ),
        Container(
          height: 20.0,
          width: 2.0,
          color: Colors.white70,
        ),
        Text(
          //
          "${widget.dat.porcentajeDescuento}"
          r" % Descuento",
          style: TextStyle(fontSize: 15.0),
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
    final descripcion = Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: <Widget>[
          Divider(),
          Text(
            'Descripcion del Producto',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300]),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.dat.descripcion,
            style: TextStyle(color: Colors.green[300], fontSize: 14.0),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
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
          imagen,
          titulo,
          costo,
          descripcion,
        ],
      ),
    );
  }
}
