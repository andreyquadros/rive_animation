import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePageFull extends StatefulWidget {
  const HomePageFull({Key? key}) : super(key: key);

  @override
  State<HomePageFull> createState() => _HomePageFullState();
}

class _HomePageFullState extends State<HomePageFull> {
  late RiveAnimationController _chargedController;
  late RiveAnimationController _fullController;
  bool isChargedCompleted = false;

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador para "0%" e "100%"
    _chargedController = OneShotAnimation(
      '0%', // Nome da animação "0%"
      autoplay: false,
    );

    _fullController = OneShotAnimation(
      '100%', // Nome da animação "100%"
      autoplay: false,
    );
  }

  void _togglePlayCharged() {
    setState(() {
      if (!isChargedCompleted) {
        _chargedController.isActive = true;
        isChargedCompleted = true;
      } else {
        _fullController.isActive = true;
        isChargedCompleted = false; // Reset para permitir repetir a sequência
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testando Animações Rive'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _togglePlayCharged,
          child: Container(
            width: 300,
            height: 300,
            child: RiveAnimation.asset(
              'assets/animations/charge.riv', // Certifique-se de que o caminho está correto
              controllers: [_chargedController, _fullController],
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
