import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testando Animações Rive'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: AnimationWidget(),
      ),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Define o controlador para a animação "100%", sem autoplay
    _controller = OneShotAnimation('100%', autoplay: false);
  }

  void _playAnimation() {
    // Ativa o controlador para reproduzir a animação uma vez
    _controller.isActive = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _playAnimation, // Chama a animação ao tocar na tela
      child: Container(
        width: 300,
        height: 300,
        child: RiveAnimation.asset(
          'assets/animations/charge.riv', // Caminho do arquivo .riv
          controllers: [_controller],
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
