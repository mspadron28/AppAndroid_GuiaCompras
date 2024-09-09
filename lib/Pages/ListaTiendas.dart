import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../CustomInfoWindow/custom_info_window.dart';

// Mapa que contiene las tiendas según la ubicación seleccionada
final Map<String, List<Map<String, dynamic>>> tiendasPorUbicacion = {
  'Conocoto': [
    {'nombre': 'Tía', 'categoria': 'Supermercado', 'latitud': -0.2933478828867621, 'longitud': -78.4785394454279},
    {'nombre': 'AKI', 'categoria': 'Supermercado', 'latitud': -0.2952748113411629, 'longitud': -78.47923739721809},
    {'nombre': 'Bodega La Rebaja', 'categoria': 'Almacén', 'latitud': -0.29599264502910816, 'longitud': -78.4790904852509},
    {'nombre': 'Tuti Conocoto', 'categoria': 'Supermercado de descuentos', 'latitud': -0.2982364998102283, 'longitud': -78.4808220301657},
    {'nombre': 'Licoreria RR', 'categoria': 'Licoreria', 'latitud': -0.29158138988839677, 'longitud': -78.4836742300681},
    {'nombre': 'Minimarket La Moya', 'categoria': 'Mini mercado', 'latitud': -0.3001464332987057, 'longitud': -78.47442252836225},
    {'nombre': 'Creaciones Haro', 'categoria': 'Ropa', 'latitud': -0.29373353563339444, 'longitud': -78.47395520705426},
    {'nombre': 'Víveres Mafer', 'categoria': 'Mini mercado', 'latitud': -0.2910064874945348, 'longitud': -78.47363282408006},

  ],
  'Sangolqui': [
    {'nombre': 'River Mall', 'categoria': 'Centro comercial', 'latitud': -0.3240184579504637, 'longitud': -78.44894966182589},
    {'nombre': 'Santa María', 'categoria': 'Supermercado', 'latitud': -0.3293381138226203, 'longitud': -78.4513004765491},
    {'nombre': 'AKÍ', 'categoria': 'Mercado', 'latitud': -0.3296225399038632,  'longitud': -78.45054916563987},
    {'nombre': 'Colibrí Floristería', 'categoria': 'Floristería', 'latitud': -0.3322853161145226,  'longitud': -78.44641243482619},
    {'nombre': 'PIERRUNOS Pet Shop', 'categoria': 'Tienda de mascotas', 'latitud': -0.33006461486569966, 'longitud': -78.44868600842156},
    {'nombre': 'Mi Ángel Azul', 'categoria': 'Tienda de ropa', 'latitud': -0.3296225399038632,  'longitud': -78.45054916563987},
    {'nombre': 'Elegant Shoes', 'categoria': 'Zapatería', 'latitud': -0.32946413570271393, 'longitud': -78.44889471015654 },
    {'nombre': 'Tía', 'categoria': 'Supermercado', 'latitud': -0.32857085676686565, 'longitud': -78.45032830630848 },
  ],
  'Alangasi': [
    {'nombre': 'Quimbitas Plaza', 'categoria': 'Plaza comercial', 'latitud': -0.2953995774631945, 'longitud': -78.45290135438108},
    {'nombre': 'TuTi | Ilaló', 'categoria': 'Supermercado de descuentos', 'latitud': -0.29692447463231164, 'longitud': -78.4545040156325 },
    {'nombre': 'Puruhá Shopping', 'categoria': 'Plaza comercial', 'latitud': -0.2913399215022572,  'longitud': -78.44755160185014},
    {'nombre': 'San Luis Shopping', 'categoria': 'Centro comercial', 'latitud': -0.3079125083033049, 'longitud': -78.45007332091349},
    {'nombre': 'MegaKywi', 'categoria': 'Ferretería', 'latitud': -0.3082563587400099,  'longitud': -78.44711788981004},
    {'nombre': 'Tienda Bady Boo', 'categoria': 'Mini mercado', 'latitud': -0.3070882952907428,  'longitud': -78.44295549823444 },
    {'nombre': 'El Surtido', 'categoria': 'Minimarket', 'latitud': -0.306627414584936, 'longitud': -78.4383029327915 },
    {'nombre': 'Fruteria Fabi', 'categoria': 'Frutería', 'latitud': -0.29747074674462537, 'longitud': -78.43999984111653 },
  ],

};

class ListaTiendas extends StatelessWidget {
  final String ubicacionSeleccionada;

  const ListaTiendas({Key? key, required this.ubicacionSeleccionada}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiendas = tiendasPorUbicacion[ubicacionSeleccionada] ?? [];

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
          Column(
            children: [
              // Imagen del toldo de la tienda
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image.asset(
                  'assets/toldoTienda.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,  // Una sola columna
                    childAspectRatio: 3, // Proporción de aspecto de cada elemento
                  ),
                  itemCount: tiendas.length,
                  itemBuilder: (context, index) {
                    final tienda = tiendas[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black, width: 2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Información de la tienda
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tienda['nombre'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  tienda['categoria'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            // Botón "Ir" con animación Lottie dentro
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffc2e4f5),
                                side: BorderSide(color: Colors.black, width: 3),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                textStyle: TextStyle(fontSize: 20, fontFamily: 'FredokaExpanded'),
                                fixedSize: Size(100, 60),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CustomInfoWindowMarker(
                                      nombreTienda: tienda['nombre'],
                                      latitud: tienda['latitud'],
                                      longitud: tienda['longitud'],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Ir', style: TextStyle(color: Colors.black)),
                                  SizedBox(width: 5),
                                  Lottie.network(
                                    'https://lottie.host/bae5e6c1-3ddc-4bc8-b894-e312fe8947ad/LI1Z7Pb0Pw.json',
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
