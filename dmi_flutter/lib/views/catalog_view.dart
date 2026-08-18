import 'package:flutter/material.dart';

class CatalogView extends StatelessWidget {
  final VoidCallback onBack;

  const CatalogView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'title': 'Escaneo OBD-II Avanzado', 'price': '\$120.000', 'desc': 'Diagnóstico computarizado de alta precisión.'},
      {'title': 'Mapeo de ECU / Tuning', 'price': '\$850.000', 'desc': 'Optimización de rendimiento y curvas de potencia.'},
      {'title': 'Limpieza de Inyectores', 'price': '\$180.000', 'desc': 'Ultrasonido y prueba de caudal.'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('CATÁLOGO DE SERVICIOS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final s = services[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121214),
                    border: Border.all(color: const Color(0xFFff2f55).withOpacity(0.4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(s['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white))),
                          Text(s['price']!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Color(0xFFff2f55))),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(s['desc']!, style: const TextStyle(color: Color(0xFFc9bcc2), fontSize: 11)),
                    ],
                  ),
                );
              },
            ),
          ),
          Center(child: TextButton(onPressed: onBack, child: const Text('<- Volver al inicio', style: TextStyle(color: Colors.grey, fontSize: 12)))),
        ],
      ),
    );
  }
}