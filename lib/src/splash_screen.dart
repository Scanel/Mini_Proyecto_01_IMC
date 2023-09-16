import 'package:flutter/material.dart';
import 'package:miniproyecto_01/src/home_page.dart';
import 'package:miniproyecto_01/src/imc.dart';

class SplashScreen extends StatefulWidget {
  final Data data;
  SplashScreen({required this.data});

  @override
  _SplashScreenState createState() =>
      _SplashScreenState(dataResult: DataResult(data: data));
}

class _SplashScreenState extends State<SplashScreen> {
  final DataResult dataResult;
  _SplashScreenState({required this.dataResult});
  @override
  void initState() {
    dataResult.calcularIMC(); //Calcula el IMC
    Future.delayed(
        Duration(milliseconds: 5000),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => IMC(dataResult: dataResult))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/tuerca.png'),
            Text('Calculando IMC...'),
            SizedBox(height: 50),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class DataResult {
  Data data;
  double IMC = 0;
  String urlImage = '';
  String clasificacion = '';
  DataResult({required this.data});

  calcularIMC() {
    IMC = (data.peso / (data.estatura * data.estatura));

    if (IMC < 18) {
      urlImage = 'assets/images/PesoBajo.jpg';
      clasificacion = 'Peso Bajo';
    } else if (IMC < 24.9) {
      urlImage = 'assets/images/Normal.jpg';
      clasificacion = 'Normal';
    } else if (IMC < 26.9) {
      urlImage = 'assets/images/obesidad.jpg';
      clasificacion = 'Obesidad';
    } else if (IMC < 29.9) {
      urlImage = 'assets/images/obesidad.jpg';
      clasificacion = 'Obesidad grado I';
    } else if (IMC < 39.9) {
      urlImage = 'assets/images/obesidad.jpg';
      clasificacion = 'Obesidad grado II';
    } else {
      urlImage = 'assets/images/obesidad.jpg';
      clasificacion = 'Obesidad grado III';
    }
  }
}
