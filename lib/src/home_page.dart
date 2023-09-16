import 'package:flutter/material.dart';
import 'package:miniproyecto_01/src/splash_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ctrlEstatura = new TextEditingController();
  final ctrlPeso = new TextEditingController();
  final data = new Data(estatura: 0, peso: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Mini Proyecto 01 (IMC)'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlEstatura,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  hintText: 'Ingresa tu estatura en metros',
                  contentPadding: EdgeInsets.all(20)),
            ),
            TextField(
              controller: ctrlPeso,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  hintText: 'Ingresa tu peso',
                  contentPadding: EdgeInsets.all(20)),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data.estatura = double.parse(ctrlEstatura.text);
                  data.peso = double.parse(ctrlPeso.text);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SplashScreen(data: data)));
                });
              },
              child: Text('Calcular IMC'),
            )
          ],
        ),
      ),
    );
  }
}

class Data {
  double estatura;
  double peso;

  Data({required this.estatura, required this.peso});
}
