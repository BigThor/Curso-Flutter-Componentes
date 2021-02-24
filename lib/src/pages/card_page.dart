import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: (){
                  
                },
              ),
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){

                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      // clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://i.pinimg.com/originals/34/59/3b/34593bc301b2ab36e6fa1d7f7799d6fa.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(seconds: 1),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner xd')
          ),
        ],
      ),
    );
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        // color: Colors.red
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 6.0)
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}