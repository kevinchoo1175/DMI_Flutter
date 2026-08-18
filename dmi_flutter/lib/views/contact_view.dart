import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final VoidCallback onBack;

  const ContactView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF121214),
            border: Border.all(color: const Color(0xFFff2f55).withOpacity(0.5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('CONTÁCTANOS', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2)),
              const SizedBox(height: 16),
              const Text('Ubicación: Taller Principal DMI, Bogotá', style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 8),
              const Text('Teléfono: +57 300 000 0000', style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 8),
              const Text('Correo: contacto@disolmotors.com', style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFff2f55)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: onBack,
                child: const Center(child: Text('VOLVER AL INICIO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}