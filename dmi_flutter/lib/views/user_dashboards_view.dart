import 'package:flutter/material.dart';

class UserDashboardView extends StatelessWidget {
  final VoidCallback onAddVehicle;
  final VoidCallback onScheduleAppointment;

  const UserDashboardView({super.key, required this.onAddVehicle, required this.onScheduleAppointment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MI CUENTA / GARAJE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFff2f55), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  onPressed: onAddVehicle,
                  child: const Text('Registrar Unidad', style: TextStyle(color: Colors.white, fontSize: 11)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFFff2f55)), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  onPressed: onScheduleAppointment,
                  child: const Text('Agendar Cita', style: TextStyle(color: Colors.white, fontSize: 11)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Tus vehículos registrados:', style: TextStyle(color: Color(0xFFc9bcc2), fontSize: 12)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF121214), border: Border.all(color: Colors.grey.withOpacity(0.3))),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Camaro 2018 (XYZ-123)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
                Text('En Taller', style: TextStyle(color: Color(0xFFff2f55), fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}