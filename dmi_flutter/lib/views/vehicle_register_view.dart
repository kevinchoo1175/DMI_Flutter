import 'package:flutter/material.dart';

class VehicleRegisterView extends StatelessWidget {
  final VoidCallback onComplete;

  const VehicleRegisterView({super.key, required this.onComplete});

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
              const Text('REGISTRAR UNIDAD', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2)),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(filled: true, fillColor: Colors.black, labelText: 'MARCA Y MODELO', labelStyle: TextStyle(fontSize: 10))),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(filled: true, fillColor: Colors.black, labelText: 'PLACA / IDENTIFICACIÓN', labelStyle: TextStyle(fontSize: 10))),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFff2f55),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  onPressed: onComplete,
                  child: const Text('GUARDAR UNIDAD', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}