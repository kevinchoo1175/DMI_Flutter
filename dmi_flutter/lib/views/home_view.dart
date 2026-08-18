import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final Function(String) onNavigate;

  const HomeView({super.key, required this.onNavigate});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentSlide = 0;
  final List<String> _slides = [
    'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?q=80&w=800&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=800&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1542282088-72c9c27ed0cd?q=80&w=800&auto=format&fit=crop',
  ];

  final List<Map<String, dynamic>> _projects = [
    {
      'titulo': 'Chevrolet Camaro 2018',
      'descripcion': 'Optimización de software y diagnóstico computarizado avanzado.',
      'imagen': 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?q=80&w=500&auto=format&fit=crop',
    },
    {
      'titulo': 'Porsche 911 GT3',
      'descripcion': 'Calibración de inyección electrónica y pruebas de presión.',
      'imagen': 'https://images.unsplash.com/photo-1614162692292-7ac56d7f7f1e?q=80&w=500&auto=format&fit=crop',
    },
    {
      'titulo': 'Lamborghini Aventador',
      'descripcion': 'Mantenimiento de alta precisión en admisión y mapeo de ECU.',
      'imagen': 'https://images.unsplash.com/photo-1544829099-b9a0c07fad1a?q=80&w=500&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // HERO SECTION MÓVIL
          Container(
            height: 380,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_slides[_currentSlide]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.3), Colors.black],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'DISOL MOTORS',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mecánica de Precisión - Inyección Electrónica',
                      style: TextStyle(color: Color(0xFFc9bcc2), fontSize: 11),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFff2f55),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      onPressed: () => widget.onNavigate('catalogo'),
                      child: const Text(
                        'EXPLORAR CATÁLOGO',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SECCIÓN PROYECTOS ÉLITE MÓVIL
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROYECTOS ÉLITE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5),
                ),
                const SizedBox(height: 14),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _projects.length,
                  itemBuilder: (context, index) {
                    final project = _projects[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF121214),
                        border: Border.all(color: const Color(0xFFff2f55).withOpacity(0.4)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: Image.network(project['imagen']!, width: 70, height: 70, fit: BoxFit.cover),
                        title: Text(project['titulo']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(project['descripcion']!, style: const TextStyle(color: Color(0xFFc9bcc2), fontSize: 11)),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}