import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final Function(Map<String, dynamic>) onLoginSuccess;
  final VoidCallback onSwitchToRegister;
  final Function(Map<String, dynamic>) openConfirm;

  const LoginView({
    super.key,
    required this.onLoginSuccess,
    required this.onSwitchToRegister,
    required this.openConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
            children: [
              const Text(
                'CONTROL DE ACCESO',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 2),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'CORREO ELECTRÓNICO',
                  labelStyle: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Color(0xFFff2f55))),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'CONTRASEÑA',
                  labelStyle: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Color(0xFFff2f55))),
                ),
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
                    final email = emailController.text.trim();
                    if (email.isEmpty || passwordController.text.isEmpty) {
                      openConfirm({
                        'kicker': 'Acceso requerido',
                        'title': 'Datos incompletos',
                        'message': 'Ingresa tu correo y contraseña.',
                        'confirmText': 'Entendido',
                      });
                      return;
                    }

                    onLoginSuccess({
                      'email': email,
                      'role': email.contains('admin') ? 'admin' : 'usuario',
                      'nombre': email.split('@')[0],
                    });
                  },
                  child: const Text('INGRESAR', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5, fontSize: 12)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: onSwitchToRegister,
                child: const Text('¿No tienes cuenta? Regístrate aquí', style: TextStyle(color: Color(0xFFff2f55), fontSize: 11)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}