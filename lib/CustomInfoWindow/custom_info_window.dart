import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomInfoWindowMarker extends StatefulWidget {
  final String nombreTienda;
  final double latitud;
  final double longitud;

  const CustomInfoWindowMarker({
    Key? key,
    required this.nombreTienda,
    required this.latitud,
    required this.longitud,
  }) : super(key: key);

  @override
  State<CustomInfoWindowMarker> createState() => _CustomInfoWindowMarkerState();
}

class _CustomInfoWindowMarkerState extends State<CustomInfoWindowMarker> {
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  Marker? myMarker;

  final Map<String, IconData> categoryIcons = {
    'Frutas y Verduras': Icons.local_florist,
    'Lácteos': Icons.local_drink,
    'Carnes': Icons.local_dining,
    'Panadería y Pastelería': Icons.cake,
    'Bebidas': Icons.local_bar,
    'Bebidas sin alcohol': Icons.local_bar,
    'Bebidas alcoholicas': Icons.local_bar,
    'Galletas': Icons.cookie,
    'Floristería': Icons.local_florist,
    'Pet': Icons.pets,
    'Ropa': Icons.local_laundry_service,
    'Accesorios': Icons.engineering_rounded,
    'Zapatos': Icons.sports_gymnastics_outlined,
  };

  final Map<String, Color> categoryColors = {
    'Frutas y Verduras': Colors.lightGreen.shade100,
    'Lácteos': Colors.lightBlue.shade100,
    'Carnes': Colors.red.shade100,
    'Panadería y Pastelería': Colors.brown.shade100,
    'Bebidas sin alcohol': Colors.orange.shade100,
    'Bebidas': Colors.orange.shade100,
    'Bebidas alcoholicas': Colors.redAccent.shade100,
    'Galletas': Colors.brown.shade100,
    'Floristería': Colors.pink.shade100,
    'Pet': Colors.yellow.shade100,
    'Ropa': Colors.blueGrey.shade100,
    'Accesorios': Colors.blueAccent.shade100,
    'Zapatos': Colors.teal.shade100,
  };

  final Map<String, List<dynamic>> markerInfos = {
    //================================CONOCOTO====================================
    'Tía': [
      'Tía',
      'Supermercado',
      'assets/tienda1Conocoto.png',
      {
        'Frutas y Verduras': [
          {'name': 'Manzanas', 'price': '1.50 USD/kg', 'image': 'assets/frutas/manzanas.png'},
          {'name': 'Plátanos', 'price': '0.99 USD/kg', 'image': 'assets/frutas/platanos.png'},
          {'name': 'Tomates', 'price': '1.20 USD/kg', 'image': 'assets/frutas/tomates.png'},
        ],
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Queso', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
        ],
        'Carnes': [
          {'name': 'Pollo', 'price': '4.00 USD/kg', 'image': 'assets/carnes/pollo.png'},
          {'name': 'Carne de Res', 'price': '7.50 USD/kg', 'image': 'assets/carnes/carne_res.png'},
          {'name': 'Pescado', 'price': '6.00 USD/kg', 'image': 'assets/carnes/pescado.png'},
        ],
        'Bebidas': [
          {'name': 'Inca Kola', 'price': '1.00 USD/500ml', 'image': 'assets/bebidas/inca.png'},
          {'name': 'Sprite', 'price': '1.00 USD/500ml', 'image': 'assets/bebidas/sprite.png'},
          {'name': 'Jugo de Naranja', 'price': '1.50 USD/1L', 'image': 'assets/bebidas/jugo_naranja.png'},
        ],
      },
    ],
    'AKI': [
      'AKI',
      'Supermercado',
      'assets/tienda2Conocoto.png',
      {
        'Frutas y Verduras': [
          {'name': 'Uvas', 'price': '2.50 USD/kg', 'image': 'assets/frutas/uvas.png'},
          {'name': 'Espinacas', 'price': '1.00 USD/kg', 'image': 'assets/frutas/espinacas.png'},
          {'name': 'Pepinos', 'price': '0.80 USD/kg', 'image': 'assets/frutas/pepinos.png'},
        ],
        'Lácteos': [
          {'name': 'Helado', 'price': '2.00 USD/500ml', 'image': 'assets/lacteos/helado.png'},
          {'name': 'Crema', 'price': '1.50 USD/250ml', 'image': 'assets/lacteos/crema.png'},
          {'name': 'Kéfir', 'price': '1.80 USD/500ml', 'image': 'assets/lacteos/kefir.png'},
        ],
        'Carnes': [
          {'name': 'Pollo Orgánico', 'price': '5.00 USD/kg', 'image': 'assets/carnes/pollo_organico.png'},
          {'name': 'Cordero', 'price': '10.00 USD/kg', 'image': 'assets/carnes/cordero.png'},
          {'name': 'Conejo', 'price': '9.00 USD/kg', 'image': 'assets/carnes/conejo.png'},
        ],
        'Panadería y Pastelería': [
          {'name': 'Bagels', 'price': '2.50 USD/paquete', 'image': 'assets/panaderia/bagels.png'},
          {'name': 'Croissants', 'price': '1.50 USD/cada uno', 'image': 'assets/panaderia/croissants.png'},
          {'name': 'Muffins', 'price': '1.00 USD/cada uno', 'image': 'assets/panaderia/muffins.png'},
        ],
      },
    ],
    'Bodega La Rebaja': [
      'Bodega La Rebaja',
      'Almacén',
      'assets/tienda3Conocoto.png',
      {
        'Galletas': [
          {'name': 'Galletas de Chocolate', 'price': '2.00 USD/paquete', 'image': 'assets/galletas/chocolate.png'},
          {'name': 'Galletas Clásicas', 'price': '1.50 USD/paquete', 'image': 'assets/galletas/clasicas.png'},
          {'name': 'Galletas Red Velvet', 'price': '2.50 USD/paquete', 'image': 'assets/galletas/red_velvet.png'},
        ],
        'Carnes': [
          {'name': 'Pollo Orgánico', 'price': '5.00 USD/kg', 'image': 'assets/carnes/pollo_organico.png'},
          {'name': 'Cordero', 'price': '10.00 USD/kg', 'image': 'assets/carnes/cordero.png'},
          {'name': 'Conejo', 'price': '9.00 USD/kg', 'image': 'assets/carnes/conejo.png'},
        ],
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Queso', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
        ],
      },
    ],
    'Tuti Conocoto': [
      'Tuti Conocoto',
      'Supermercado de descuentos',
      'assets/tienda4Conocoto.png',
      {
        'Bebidas': [
          {'name': 'Agua Mineral', 'price': '0.50 USD/500ml', 'image': 'assets/bebidas/agua_mineral.png'},
          {'name': 'Limonada', 'price': '1.20 USD/1L', 'image': 'assets/bebidas/limonada.png'},
          {'name': 'Smoothie', 'price': '2.50 USD/500ml', 'image': 'assets/bebidas/smoothie.png'},
        ],
        'Panadería y Pastelería': [
          {'name': 'Bagels', 'price': '2.50 USD/paquete', 'image': 'assets/panaderia/bagels.png'},
          {'name': 'Muffins', 'price': '1.00 USD/cada uno', 'image': 'assets/panaderia/muffins.png'},
          {'name': 'Tarta de Manzana', 'price': '3.00 USD/cada una', 'image': 'assets/panaderia/tarta_manzana.png'},
        ],
        'Galletas': [
          {'name': 'Galletas de Chocolate', 'price': '2.00 USD/paquete', 'image': 'assets/galletas/chocolate.png'},
          {'name': 'Galletas Clásicas', 'price': '1.50 USD/paquete', 'image': 'assets/galletas/clasicas.png'},
          {'name': 'Galletas Red Velvet', 'price': '2.50 USD/paquete', 'image': 'assets/galletas/red_velvet.png'},
        ],
        'Carnes': [
          {'name': 'Pollo Orgánico', 'price': '5.00 USD/kg', 'image': 'assets/carnes/pollo_organico.png'},
          {'name': 'Cordero', 'price': '10.00 USD/kg', 'image': 'assets/carnes/cordero.png'},
          {'name': 'Conejo', 'price': '9.00 USD/kg', 'image': 'assets/carnes/conejo.png'},
        ],
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Queso', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
        ],
      },
    ],
    'Licoreria RR': [
      'Licoreria RR',
      'Licoreria',
      'assets/tienda5Conocoto.png',
      {
        'Bebidas sin alcohol': [
          {'name': 'Refresco', 'price': '1.00 USD/500ml', 'image': 'assets/bebidas/refresco.png'},
          {'name': 'Inca Kola', 'price': '1.00 USD/500ml', 'image': 'assets/bebidas/inca.png'},
          {'name': 'Sprite', 'price': '1.00 USD/500ml', 'image': 'assets/bebidas/sprite.png'},
        ],
        'Bebidas alcoholicas': [
          {'name': 'Whisky', 'price': '29.99 USD/100ml', 'image': 'assets/bebidas/whisky.png'},
          {'name': 'Jack Daniels', 'price': '30.00 USD/900ml', 'image': 'assets/bebidas/whisky2.png'},
          {'name': 'Red Label', 'price': '25.00 USD/800ml', 'image': 'assets/bebidas/redlabel.png'},
        ],
      },
    ],
    'Minimarket La Moya': [
      'Minimarket La Moya',
      'Mini mercado',
      'assets/tienda6Conocoto.png',
      {
        'Frutas y Verduras': [
          {'name': 'Peras', 'price': '1.50 USD/kg', 'image': 'assets/frutas/peras.png'},
          {'name': 'Pepinos', 'price': '0.80 USD/kg', 'image': 'assets/frutas/pepinos.png'},
          {'name': 'Tomates', 'price': '1.20 USD/kg', 'image': 'assets/frutas/tomates.png'},
        ],
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Queso', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
        ],
        'Panadería y Pastelería': [
          {'name': 'Bagels', 'price': '2.50 USD/paquete', 'image': 'assets/panaderia/bagels.png'},
          {'name': 'Muffins', 'price': '1.00 USD/cada uno', 'image': 'assets/panaderia/muffins.png'},
          {'name': 'Tarta de Manzana', 'price': '3.00 USD/cada una', 'image': 'assets/panaderia/tarta_manzana.png'},
        ],
      },
    ],
    'Creaciones Haro': [
      'Creaciones Haro',
      'Ropa',
      'assets/tienda7Conocoto.png',
      {
        'Ropa': [
          {'name': 'Camisa Nike', 'price': '20.00 USD', 'image': 'assets/ropa/camisaNike.png'},
          {'name': 'Short Adidas', 'price': '15.00 USD', 'image': 'assets/ropa/shortAdidas.png'},
        ],
        'Zapatos': [
          {'name': 'Zapato Nike', 'price': '70.00 USD', 'image': 'assets/ropa/zapatoNike.png'},
          {'name': 'Zapato Nike 2', 'price': '75.00 USD', 'image': 'assets/ropa/zapatoNike2.png'},
          {'name': 'Zapato Nike 3', 'price': '80.00 USD', 'image': 'assets/ropa/zapatoNike3.png'},
          {'name': 'Zapato Adidas', 'price': '60.00 USD', 'image': 'assets/ropa/zapatoAdidas.png'},
        ]
      },
    ],
    'Víveres Mafer': [
      'Víveres Mafer',
      'Mini mercado',
      'assets/tienda8Conocoto.png',
      {
        'Frutas y Verduras': [
          {'name': 'Plátanos', 'price': '0.99 USD/kg', 'image': 'assets/frutas/platanos.png'},
          {'name': 'Uvas', 'price': '2.50 USD/kg', 'image': 'assets/frutas/uvas.png'},
          {'name': 'Tomates', 'price': '1.20 USD/kg', 'image': 'assets/frutas/tomates.png'},
        ],
        'Lácteos': [
          {'name': 'Queso', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
        ],
        'Panadería y Pastelería': [
          {'name': 'Bagels', 'price': '2.50 USD/paquete', 'image': 'assets/panaderia/bagels.png'},
          {'name': 'Muffins', 'price': '1.00 USD/cada uno', 'image': 'assets/panaderia/muffins.png'},
          {'name': 'Tarta de Manzana', 'price': '3.00 USD/cada una', 'image': 'assets/panaderia/tarta_manzana.png'},
        ],
      },
    ],
    //================================SANGOLQUI====================================
    'River Mall': [
      'River Mall',
      'Centro comercial',
      'assets/tienda1Sangolqui.png',
      {
        'Ropa': [
          {'name': 'Camisa', 'price': '25.00 USD', 'image': 'assets/ropa/camisa.png'},
          {'name': 'Jean', 'price': '40.00 USD', 'image': 'assets/ropa/jean.png'},
          {'name': 'Short', 'price': '20.00 USD', 'image': 'assets/ropa/short.png'},
        ],
        'Zapatos': [
          {'name': 'Zapato Adidas', 'price': '60.00 USD', 'image': 'assets/ropa/zapatoAdidas.png'},
          {'name': 'Zapato Nike', 'price': '70.00 USD', 'image': 'assets/ropa/zapatoNike.png'},
        ],
      },
    ],
    'Santa María': [
      'Santa María',
      'Supermercado',
      'assets/tienda2Sangolqui.png',
      {
        'Frutas y Verduras': [
          {'name': 'Peras', 'price': '1.80 USD/kg', 'image': 'assets/frutas/peras.png'},
          {'name': 'Manzanas', 'price': '1.50 USD/kg', 'image': 'assets/frutas/manzanas.png'},
          {'name': 'Tomates', 'price': '1.20 USD/kg', 'image': 'assets/frutas/tomates.png'},
        ],
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Queso Cottage', 'price': '3.50 USD/500g', 'image': 'assets/lacteos/queso_cottage.png'},
          {'name': 'Crema', 'price': '1.50 USD/250ml', 'image': 'assets/lacteos/crema.png'},
        ],
        'Carnes': [
          {'name': 'Carne de Res', 'price': '7.50 USD/kg', 'image': 'assets/carnes/carne_res.png'},
          {'name': 'Pollo', 'price': '4.00 USD/kg', 'image': 'assets/carnes/pollo.png'},
          {'name': 'Pescado', 'price': '6.00 USD/kg', 'image': 'assets/carnes/pescado.png'},
        ],
      },
    ],
    'AKÍ': [
      'AKÍ',
      'Mercado',
      'assets/tienda3Sangolqui.png',
      {
        'Panadería y Pastelería': [
          {'name': 'Bagels', 'price': '2.50 USD/paquete', 'image': 'assets/panaderia/bagels.png'},
          {'name': 'Muffins', 'price': '1.00 USD/cada uno', 'image': 'assets/panaderia/muffins.png'},
          {'name': 'Tarta de Manzana', 'price': '3.00 USD/cada una', 'image': 'assets/panaderia/tarta_manzana.png'},
        ],
        'Bebidas': [
          {'name': 'Agua Mineral', 'price': '0.50 USD/500ml', 'image': 'assets/bebidas/agua_mineral.png'},
          {'name': 'Refresco', 'price': '1.00 USD/500ml', 'image': 'assets/bebidas/refresco.png'},
          {'name': 'Jugo de Naranja', 'price': '1.50 USD/1L', 'image': 'assets/bebidas/jugo_naranja.png'},
        ],
      },
    ],
    'Colibrí Floristería': [
      'Colibrí Floristería',
      'Floristería',
      'assets/tienda4Sangolqui.png',
      {
        'Floristería': [
          {'name': 'Arreglo Floral Básico', 'price': '15.00 USD', 'image': 'assets/floristeria/ramoBasico.png'},
          {'name': 'Arreglo Floral Premium', 'price': '25.00 USD', 'image': 'assets/floristeria/arregloFloral2.png'},
          {'name': 'Ramo de Flores', 'price': '10.00 USD', 'image': 'assets/floristeria/arregloFlora.png'},
        ],
      },
    ],
    'PIERRUNOS Pet Shop': [
      'PIERRUNOS Pet Shop',
      'Tienda de mascotas',
      'assets/tienda5Sangolqui.png',
      {
        'Pet': [
          {'name': 'Comida para Gato Whiskas', 'price': '3.50 USD/paquete', 'image': 'assets/pet/comidaGatoWhiskas.png'},
          {'name': 'Comida para Perro', 'price': '4.00 USD/paquete', 'image': 'assets/pet/comidaPerro.png'},
          {'name': 'Comida para Gato', 'price': '3.00 USD/paquete', 'image': 'assets/pet/comidaGato.png'},
        ],
      },
    ],
    'Mi Ángel Azul': [
      'Mi Ángel Azul',
      'Tienda de ropa',
      'assets/tienda6Sangolqui.png',
      {
        'Ropa': [
          {'name': 'Camisa Adidas', 'price': '30.00 USD', 'image': 'assets/ropa/camisetaAdidas.png'},
          {'name': 'Buzo', 'price': '35.00 USD', 'image': 'assets/ropa/buzo.png'},
          {'name': 'Jean', 'price': '40.00 USD', 'image': 'assets/ropa/jean2.png'},
        ],
      },
    ],
    'Elegant Shoes': [
      'Elegant Shoes',
      'Zapatería',
      'assets/tienda7Sangolqui.png',
      {
        'Zapatos': [
          {'name': 'Zapato Nike', 'price': '70.00 USD', 'image': 'assets/ropa/zapatoNike.png'},
          {'name': 'Zapato Nike 2', 'price': '75.00 USD', 'image': 'assets/ropa/zapatoNike2.png'},
          {'name': 'Zapato Nike 3', 'price': '80.00 USD', 'image': 'assets/ropa/zapatoNike3.png'},
          {'name': 'Zapato Adidas', 'price': '60.00 USD', 'image': 'assets/ropa/zapatoAdidas.png'},
        ],
      },
    ],
    'Tía': [
      'Tía',
      'Supermercado',
      'assets/tienda8Sangolqui.png',
      {
        'Frutas y Verduras': [
          {'name': 'Plátanos', 'price': '0.99 USD/kg', 'image': 'assets/frutas/platanos.png'},
          {'name': 'Pepinos', 'price': '0.80 USD/kg', 'image': 'assets/frutas/pepinos.png'},
          {'name': 'Tomates', 'price': '1.20 USD/kg', 'image': 'assets/frutas/tomates.png'},
        ],
        'Lácteos': [
          {'name': 'Queso Fresco', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
          {'name': 'Helado', 'price': '2.00 USD/500ml', 'image': 'assets/lacteos/helado.png'},
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
        ],
        'Galletas': [
          {'name': 'Galletas de Chocolate', 'price': '2.00 USD/paquete', 'image': 'assets/galletas/chocolate.png'},
          {'name': 'Galletas Clásicas', 'price': '1.50 USD/paquete', 'image': 'assets/galletas/clasicas.png'},
          {'name': 'Galletas Red Velvet', 'price': '2.50 USD/paquete', 'image': 'assets/galletas/red_velvet.png'},
        ],
      },
    ],
//================================ALANGASI====================================
    'Quimbitas Plaza': [
      'Quimbitas Plaza',
      'Plaza comercial',
      'assets/tienda1Alangasi.png',
      {
        'Ropa': [
          {'name': 'Camisa', 'price': '25.00 USD', 'image': 'assets/ropa/camisa.png'},
          {'name': 'Jean', 'price': '40.00 USD', 'image': 'assets/ropa/jean.png'},

        ],
        'Zapatos': [
          {'name': 'Zapato Nike', 'price': '70.00 USD', 'image': 'assets/ropa/zapatoNike.png'},
          {'name': 'Zapato Nike 2', 'price': '75.00 USD', 'image': 'assets/ropa/zapatoNike2.png'},
          {'name': 'Zapato Adidas', 'price': '60.00 USD', 'image': 'assets/ropa/zapatoAdidas.png'},
        ],
      },
    ],
    'TuTi | Ilaló': [
      'TuTi | Ilaló',
      'Supermercado de descuentos',
      'assets/tienda2Alangasi.png',
      {
        'Frutas y Verduras': [
          {'name': 'Manzanas', 'price': '1.50 USD/kg', 'image': 'assets/frutas/manzanas.png'},
          {'name': 'Plátanos', 'price': '0.99 USD/kg', 'image': 'assets/frutas/platanos.png'},
          {'name': 'Pepinos', 'price': '0.80 USD/kg', 'image': 'assets/frutas/pepinos.png'},
        ],
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
          {'name': 'Queso', 'price': '3.00 USD/500g', 'image': 'assets/lacteos/queso.png'},
        ],
        'Carnes': [
          {'name': 'Pollo', 'price': '4.00 USD/kg', 'image': 'assets/carnes/pollo.png'},
          {'name': 'Carne de Res', 'price': '7.50 USD/kg', 'image': 'assets/carnes/carne_res.png'},
        ],
      },
    ],
    'Puruhá Shopping': [
      'Puruhá Shopping',
      'Plaza comercial',
      'assets/tienda3Alangasi.png',
      {
        'Panadería y Pastelería': [
          {'name': 'Bagels', 'price': '2.50 USD/paquete', 'image': 'assets/panaderia/bagels.png'},
          {'name': 'Rollo de Canela', 'price': '1.50 USD/cada uno', 'image': 'assets/panaderia/rollo_canela.png'},
          {'name': 'Tarta de Manzana', 'price': '3.00 USD/cada una', 'image': 'assets/panaderia/tarta_manzana.png'},
        ],
        'Bebidas': [
          {'name': 'Jugo de Naranja', 'price': '1.50 USD/1L', 'image': 'assets/bebidas/jugo_naranja.png'},
          {'name': 'Smoothie', 'price': '2.00 USD/300ml', 'image': 'assets/bebidas/smoothie.png'},
          {'name': 'Sprite', 'price': '0.80 USD/500ml', 'image': 'assets/bebidas/sprite.png'},
        ],
      },
    ],
    'San Luis Shopping': [
      'San Luis Shopping',
      'Centro comercial',
      'assets/tienda4Alangasi.png',
      {
        'Ropa': [
          {'name': 'Camisa Nike', 'price': '30.00 USD', 'image': 'assets/ropa/camisaNike.png'},
          {'name': 'Jean', 'price': '40.00 USD', 'image': 'assets/ropa/jean2.png'},
          {'name': 'Short', 'price': '20.00 USD', 'image': 'assets/ropa/short.png'},
        ],
        'Zapatos': [
          {'name': 'Zapato Nike 3', 'price': '80.00 USD', 'image': 'assets/ropa/zapatoNike3.png'},
          {'name': 'Zapato Nike 4', 'price': '85.00 USD', 'image': 'assets/ropa/zapatoNike4.png'},
        ],
      },
    ],
    'MegaKywi': [
      'MegaKywi',
      'Ferretería',
      'assets/tienda5Alangasi.png',
      {
        'Accesorios': [
          {'name': 'Fregadero', 'price': '120.00 USD', 'image': 'assets/ferreteria/fregadero.png'},
          {'name': 'Kit de Herramientas', 'price': '45.00 USD', 'image': 'assets/ferreteria/kitHerramientas.png'},
          {'name': 'Manija', 'price': '10.00 USD', 'image': 'assets/ferreteria/manija.png'},
          {'name': 'Máscara de Protección', 'price': '25.00 USD', 'image': 'assets/ferreteria/mascara.png'},
        ],
      },
    ],
    'Tienda Bady Boo': [
      'Tienda Bady Boo',
      'Mini mercado',
      'assets/tienda6Alangasi.png',
      {
        'Lácteos': [
          {'name': 'Leche', 'price': '1.20 USD/litro', 'image': 'assets/lacteos/leche.png'},
          {'name': 'Queso Cottage', 'price': '3.50 USD/500g', 'image': 'assets/lacteos/queso_cottage.png'},
          {'name': 'Yogur', 'price': '0.80 USD/200ml', 'image': 'assets/lacteos/yogur.png'},
        ],
        'Carnes': [
          {'name': 'Pollo Orgánico', 'price': '5.00 USD/kg', 'image': 'assets/carnes/pollo_organico.png'},
          {'name': 'Conejo', 'price': '8.00 USD/kg', 'image': 'assets/carnes/conejo.png'},
        ],
      },
    ],
    'El Surtido': [
      'El Surtido',
      'Minimarket',
      'assets/tienda7Alangasi.png',
      {
        'Frutas y Verduras': [
          {'name': 'Uvas', 'price': '2.50 USD/kg', 'image': 'assets/frutas/uvas.png'},
          {'name': 'Espinacas', 'price': '1.00 USD/paquete', 'image': 'assets/frutas/espinacas.png'},
          {'name': 'Peras', 'price': '1.80 USD/kg', 'image': 'assets/frutas/peras.png'},
        ],
        'Bebidas': [
          {'name': 'Agua Mineral', 'price': '0.50 USD/500ml', 'image': 'assets/bebidas/agua_mineral.png'},
          {'name': 'Inca Kola', 'price': '1.20 USD/500ml', 'image': 'assets/bebidas/inca.png'},
          {'name': 'Limonada', 'price': '1.50 USD/500ml', 'image': 'assets/bebidas/limonada.png'},
        ],
      },
    ],
    'Fruteria Fabi': [
      'Frutería Fabi',
      'Frutería',
      'assets/tienda8Alangasi.png',
      {
        'Frutas y Verduras': [
          {'name': 'Tomates', 'price': '1.20 USD/kg', 'image': 'assets/frutas/tomates.png'},
          {'name': 'Plátanos', 'price': '0.99 USD/kg', 'image': 'assets/frutas/platanos.png'},
          {'name': 'Pepinos', 'price': '0.80 USD/kg', 'image': 'assets/frutas/pepinos.png'},
        ],
      },
    ],

  };


  List<dynamic>? selectedMarkerInfo;

  @override
  void initState() {
    super.initState();


    selectedMarkerInfo = markerInfos[widget.nombreTienda];

    // Crear el marcador usando los datos proporcionados
    myMarker = Marker(
      markerId: MarkerId(widget.nombreTienda),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(widget.latitud, widget.longitud),
    );
  }


  Widget _buildInfoWindowContent(List<dynamic> markerInfo) {
    String title = markerInfo[0];
    String description = markerInfo[1];
    String imagePath = markerInfo[2];

    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500, // Altura máxima permitida para la ventana
            minHeight: 100, // Altura mínima para que la ventana no sea demasiado pequeña
          ),
          child: Container(
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 370,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fitWidth,
                          filterQuality: FilterQuality.high,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        description,
                      ),
                    ),
                    ...markerInfo.sublist(3).expand((category) {
                      return category.entries.map((entry) {
                        String categoryName = entry.key;
                        List<dynamic> products = entry.value;
                        return ExpansionTile(
                          leading: Icon(categoryIcons[categoryName], color: categoryColors[categoryName]),
                          title: Text(categoryName),
                          backgroundColor: categoryColors[categoryName],
                          children: products.map((product) {
                            return ListTile(
                              leading: Image.asset(product['image'], width: 50, height: 50),
                              title: Text(product['name']),
                              subtitle: Text(product['price']),
                            );
                          }).toList(),
                        );
                      }).toList();
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.latitud, widget.longitud),
              zoom: 17,
            ),
            markers: myMarker != null ? {myMarker!} : {},
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
              // Mostrar la ventana de información
              if (selectedMarkerInfo != null) {
                _customInfoWindowController.addInfoWindow!(
                  _buildInfoWindowContent(selectedMarkerInfo!),
                  LatLng(widget.latitud, widget.longitud),
                );
              }
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 400,
            width: 370,
            offset: 40,
          ),
          // Botón para regresar a ListaTiendas
          Positioned(
            bottom: 40, // Ajusta este valor según sea necesario
            left: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop(); // Regresa a la pantalla anterior
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }
}
