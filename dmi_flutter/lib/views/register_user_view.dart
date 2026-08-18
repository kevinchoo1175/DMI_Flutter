import 'package:flutter/material.dart';

class RegisterUserView extends StatelessWidget {
  final VoidCallback onRegisterSuccess;
  final Function(Map<String, dynamic>) openConfirm;

  const RegisterUserView({super.key, required this.onRegisterSuccess, required this.openConfirm});

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('CREAR CUENTA', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2)),
              ),
              const SizedBox(height: 16),
              _buildField('NOMBRE COMPLETO', nombreController),
              const SizedBox(height: 10),
              _buildField('CORREO ELECTRÓNICO', emailController),
              const SizedBox(height: 10),
              _buildField('CONTRASEÑA', passController, isPass: true),
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
                    openConfirm({
                      'kicker': 'Cuenta creada',
                      'title': 'Registro exitoso',
                      'message': 'Tu cuenta fue creada correctamente. Ahora puedes iniciar sesión.',
                      'confirmText': 'Ir al login',
                      'onConfirm': onRegisterSuccess,
                    });
                  },
                  child: const Text('REGISTRARSE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {bool isPass = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white54)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: isPass,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(borderRadius: BorderRadius.zero),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Color(0xFFff2f55))),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
      ],
    );
  }
}