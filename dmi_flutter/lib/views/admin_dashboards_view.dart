import 'package:flutter/material.dart';

class AdminDashboardView extends StatelessWidget {
  final VoidCallback onLogout;

  const AdminDashboardView({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('ADMINISTRACIÓN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Color(0xFFff2f55))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[900], shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                onPressed: onLogout,
                child: const Text('Salir', style: TextStyle(color: Colors.white, fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                _buildCard('Órdenes Activas', '12 Unidades'),
                _buildCard('Citas Pendientes', '5 Programadas'),
                _buildCard('Repuestos', 'Óptimo'),
                _buildCard('Mecánicos', '4 Activos'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF121214),
        border: Border.all(color: const Color(0xFFff2f55).withOpacity(0.5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFFc9bcc2), fontSize: 11)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}