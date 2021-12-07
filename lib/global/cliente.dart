class Cliente {
  int id = 0;
  String nombre = '';
  String ciudad = '';
  String correo = '';

  Cliente();

  int get getIdCliente {
    return id;
  }

  set setIdCliente(int nuevoId) {
    id = nuevoId;
  }

  String get getNombreCliente {
    return nombre;
  }

  set setNombreCliente(String nombreCliente) {
    nombre = nombreCliente;
  }

  String get getCorreoCliente {
    return correo;
  }

  set setCorreoCliente(String correoCli) {
    correo = correoCli;
  }

  String get getCiudadCliente {
    return ciudad;
  }
}
