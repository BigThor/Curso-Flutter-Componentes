import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider(){
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged:(_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
    );
  }

  Widget _crearCheckbox(){
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) => setState(() {
        _bloquearCheck = valor;
      }),
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) => setState(() {
        _bloquearCheck = valor;
      }),
    );
  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://purepng.com/public/uploads/large/purepng.com-batmanbatmansuperherocomicdc-comicsbob-kanebat-manbruce-wayne-1701528524639kawni.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}