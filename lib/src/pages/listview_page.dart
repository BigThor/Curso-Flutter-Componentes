import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      
      if(_scrollController.position.pixels == 
         _scrollController.position.maxScrollExtent){
        // _agregar10();
        if(!_isLoading)
          _fetchData();
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: ( BuildContext context, int index){
          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration ( seconds: 2);
    new Timer( duration, (){
      _listaNumeros.clear();
      _agregar10();
    });

    return Future.delayed(duration);
  }

  Widget _crearLoading(){
    if(_isLoading ) 
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(backgroundColor: Colors.white,),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.0),
          ),
        ],
      );
    else
      return Container();
  }


  void _agregar10(){
    for(var i = 0; i < 10; i++){
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }

    setState(() {});
  }


  Future<Null> _fetchData() async{
    _isLoading = true;
    setState((){});

    final duration = new Duration(seconds:2);
    return new Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      duration: Duration(milliseconds: 450), 
      curve: Curves.fastOutSlowIn
    );
    
    _agregar10();
  }
}