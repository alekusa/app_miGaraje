class Anuncio {
  List<Datos> datos;

  Anuncio({this.datos});

  Anuncio.fromJson(Map<String, dynamic> json) {
    if (json['datos'] != null) {
      datos = new List<Datos>();
      json['datos'].forEach((v) {
        datos.add(new Datos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datos != null) {
      data['datos'] = this.datos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datos {
  String idAnuncio;
  String nomLocal;
  String titulo;
  String descripcion;
  String costo;
  String direccion;
  String cordenadaS;
  String cordenadaW;
  String img;
  String porcentajeDescuento;
  String vencimiento;
  String emailContacto;
  String telefonoContacto;
  String calificacion;
  int heroTag;

  Datos(
      {this.idAnuncio,
      this.nomLocal,
      this.titulo,
      this.descripcion,
      this.costo,
      this.direccion,
      this.cordenadaS,
      this.cordenadaW,
      this.img,
      this.porcentajeDescuento,
      this.vencimiento,
      this.emailContacto,
      this.telefonoContacto,
      this.calificacion});

  Datos.fromJson(Map<String, dynamic> json) {
    idAnuncio = json['id_anuncio'];
    nomLocal = json['nomLocal'];
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    costo = json['costo'];
    direccion = json['direccion'];
    cordenadaS = json['cordenadaS'];
    cordenadaW = json['cordenadaW'];
    img = json['img'];
    porcentajeDescuento = json['porcentajeDescuento'];
    vencimiento = json['vencimiento'];
    emailContacto = json['emailContacto'];
    telefonoContacto = json['telefonoContacto'];
    calificacion = json['calificacion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_anuncio'] = this.idAnuncio;
    data['nomLocal'] = this.nomLocal;
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    data['costo'] = this.costo;
    data['direccion'] = this.direccion;
    data['cordenadaS'] = this.cordenadaS;
    data['cordenadaW'] = this.cordenadaW;
    data['img'] = this.img;
    data['porcentajeDescuento'] = this.porcentajeDescuento;
    data['vencimiento'] = this.vencimiento;
    data['emailContacto'] = this.emailContacto;
    data['telefonoContacto'] = this.telefonoContacto;
    data['calificacion'] = this.calificacion;
    return data;
  }
}