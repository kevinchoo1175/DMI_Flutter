import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  final VoidCallback onNeedLogin;
  final VoidCallback onNeedVehicle;
  final VoidCallback onGoGarage;

  const AppointmentView({super.key, required this.onNeedLogin, required this.onNeedVehicle, required this.onGoGarage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
              const Text('AGENDAR CITA', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2)),
              const SizedBox(height: 10),
              const Text('Selecciona el servicio y aparta tu espacio de mantenimiento:', style: TextStyle(color: Color(0xFFc9bcc2), fontSize: 12)),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                dropdownColor: const Color(0xFF121214),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  labelText: 'SELECCIONAR SERVICIO',
                  labelStyle: TextStyle(fontSize: 10, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                ),
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Mantenimiento Preventivo', style: TextStyle(fontSize: 12))),
                  DropdownMenuItem(value: '2', child: Text('Diagnóstico de Inyección', style: TextStyle(fontSize: 12))),
                ],
                onChanged: (v) {},
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFff2f55),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Cita agendada correctamente!')));
                  },
                  child: const Text('CONFIRMAR CITA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}