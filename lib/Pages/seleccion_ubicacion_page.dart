import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'ListaTiendas.dart';

class SeleccionUbicacion extends StatefulWidget {
  const SeleccionUbicacion({Key? key}) : super(key: key);

  @override
  _SeleccionUbicacionState createState() => _SeleccionUbicacionState();
}

class _SeleccionUbicacionState extends State<SeleccionUbicacion> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc2e4f5),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fondoBolsos.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/top_selec_ubi.png'),
                  ),
                ),
              ),
              Spacer(flex: 1),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -200 + _animation.value * 200),
                    child: child,
                  );
                },
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5ebce5),
                        side: BorderSide(color: Colors.black, width: 3),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle: TextStyle(fontSize: 35, fontFamily: 'FredokaExpanded'),
                        fixedSize: Size(300, 80),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListaTiendas(ubicacionSeleccionada: 'Conocoto'),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Conocoto', style: TextStyle(color: Colors.black)),
                          SizedBox(width: 10),
                          Lottie.network(
                            'https://lottie.host/53488e8e-1d3d-4202-b788-194f9e9983dc/A0uGlwLFNd.json',
                            width: 80,
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8bceee),
                        side: BorderSide(color: Colors.black, width: 3),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle: TextStyle(fontSize: 35, fontFamily: 'FredokaExpanded'),
                        fixedSize: Size(300, 80),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListaTiendas(ubicacionSeleccionada: 'Sangolqui'),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sangolqui', style: TextStyle(color: Colors.black)),
                          SizedBox(width: 10),
                          Lottie.network(
                            'https://lottie.host/53488e8e-1d3d-4202-b788-194f9e9983dc/A0uGlwLFNd.json',
                            width: 70,
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffc2e4f5),
                        side: BorderSide(color: Colors.black, width: 3),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle: TextStyle(fontSize: 35, fontFamily: 'FredokaExpanded'),
                        fixedSize: Size(300, 80),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListaTiendas(ubicacionSeleccionada: 'Alangasi'),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Alangasi', style: TextStyle(color: Colors.black)),
                          SizedBox(width: 10),
                          Lottie.network(
                            'https://lottie.host/53488e8e-1d3d-4202-b788-194f9e9983dc/A0uGlwLFNd.json',
                            width: 70,
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
