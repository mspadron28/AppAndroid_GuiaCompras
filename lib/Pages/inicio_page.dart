import 'package:flutter/material.dart';
import 'package:unidad_3/Pages/seleccion_ubicacion_page.dart';
import '../CustomInfoWindow/custom_info_window.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc2e4f5),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondoBolsos.png',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,  // Ajusta el ancho del contenedor
                  height: MediaQuery.of(context).size.height * 0.37, // Ajusta el alto del contenedor
                  child: FittedBox(
                    fit: BoxFit.cover,  // Ajusta para que la imagen cubra completamente el contenedor
                    child: Image.asset('assets/aquicitoLogoUnido.png'),
                  ),
                ),
              ),
              Spacer(flex: 1),
              Text(
                'Encuentra todo lo que necesitas',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'FredokaExpanded',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '¡Aquicito nomas!',
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'FredokaExpanded',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 1),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20), // Modifica estos valores para ajustar el tamaño
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontFamily: 'FredokaExpanded',
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => SeleccionUbicacion()),
                    //MaterialPageRoute(builder: (context) => CustomInfoWindowMarker()),

                  );
                },
                child: Text('Empezar', style: TextStyle(color: Color(0xffc2e4f5))),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
