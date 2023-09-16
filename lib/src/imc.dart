import 'package:flutter/material.dart';
import 'package:miniproyecto_01/src/splash_screen.dart';

class IMC extends StatelessWidget {
  final DataResult dataResult;
  IMC({required this.dataResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC calculado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(dataResult.urlImage),
            SizedBox(height: 10, width: 10),
            Text('Clasificacion: ${dataResult.clasificacion}'),
            Text('Estatura: ${dataResult.data.estatura}'),
            Text('Peso: ${dataResult.data.peso}'),
            Text('IMC: ${dataResult.IMC.toStringAsFixed(2)}')
          ],
        ),
      ),
    );
  }
}
