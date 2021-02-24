import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final opciones = ['Limón', 'Pera', 'Naranja', 'Sandía'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes temp'),
        ),
        body: ListView(
          // children: _crearItems(),
          children: _crearItemsCorta(),
        ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista =  new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)
           ..add(Divider() );
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map( (String item){
      return Column(
        children: [
          ListTile(
            title: Text(item  + '!'),
            subtitle: Text('Hola :)'),
            leading: Icon(Icons.input),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
  }

}