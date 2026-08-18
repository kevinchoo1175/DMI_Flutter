import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final VoidCallback onRegisterSuccess;
  final VoidCallback onBack;

  const RegisterView({
    super.key,
    required this.onRegisterSuccess,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    final apellidosController = TextEditingController();
    final usuarioController = TextEditingController();
    final documentoController = TextEditingController();
    final telefonoController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 420),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF121214),
            border: Border.all(color: const Color(0xFFff2f55).withOpacity(0.4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'CREAR CUENTA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 2),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('NOMBRE COMPLETO', nombreController),
              const SizedBox(height: 12),
              _buildTextField('APELLIDOS', apellidosController),
              const SizedBox(height: 12),
              _buildTextField('NOMBRE DE USUARIO', usuarioController),
              const SizedBox(height: 12),
              _buildTextField('DOCUMENTO', documentoController, isNumeric: true),
              const SizedBox(height: 12),
              _buildTextField('TELÉFONO', telefonoController, isPhone: true),
              const SizedBox(height: 12),
              _buildTextField('CORREO ELECTRÓNICO', emailController),
              const SizedBox(height: 12),
              _buildTextField('CONTRASEÑA', passController, isPassword: true),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFff2f55),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  onPressed: onRegisterSuccess,
                  child: const Text('REGISTRARSE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: onBack,
                  child: const Text('¿Ya tienes cuenta? Inicia sesión', style: TextStyle(color: Color(0xFFff2f55), fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false, bool isNumeric = false, bool isPhone = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isNumeric ? TextInputType.number : (isPhone ? TextInputType.phone : TextInputType.text),
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Color(0xFFff2f55))),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }
}