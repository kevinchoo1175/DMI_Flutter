import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/register_user_view.dart';
import 'views/catalog_view.dart';
import 'views/appoinment_view.dart';
import 'views/contact_view.dart';
import 'views/vehicle_register_view.dart';
import 'views/user_dashboards_view.dart';
import 'views/admin_dashboards_view.dart';
import 'widgets/dmi_dialog.dart';
import 'widgets/dmi_toast.dart';

void main() {
  runApp(const DisolMotorsApp());
}

class DisolMotorsApp extends StatefulWidget {
  const DisolMotorsApp({super.key});

  @override
  State<DisolMotorsApp> createState() => _DisolMotorsAppState();
}

class _DisolMotorsAppState extends State<DisolMotorsApp> {
  String _currentView = 'inicio';
  Map<String, dynamic>? _currentUser;
  String? _afterLoginView;

  Map<String, dynamic>? _activeDialogData;
  String? _activeToastMessage;

  void _changeView(String viewName, {String? targetAfterLogin}) {
    if (targetAfterLogin != null) {
      _afterLoginView = targetAfterLogin;
    }
    
    if (viewName == 'citas' && _currentUser == null) {
      _showCustomDialog(
        kicker: "Acceso requerido",
        title: "Inicia sesión para agendar",
        message: "Para proteger tus datos y guardar la cita correctamente, primero debes iniciar sesión.",
        confirmText: "Ir al login",
        onConfirm: () => setState(() => _currentView = 'login'),
        cancelText: "Cancelar",
      );
      return;
    }

    setState(() {
      _currentView = viewName;
    });
  }

  void _handleLoginSuccess(Map<String, dynamic> userData) {
    final role = (userData['role'] ?? 'usuario').toLowerCase();
    setState(() {
      _currentUser = {...userData, 'role': role};
      _currentView = _afterLoginView ?? (role == 'admin' ? 'admin-dashboard' : 'user-dashboard');
      _afterLoginView = null;
    });

    _showCustomDialog(
      kicker: "Acceso confirmado",
      title: "Bienvenidos a Disol Motors",
      message: "Hola ${userData['nombre'] ?? 'Usuario'}, sesión iniciada correctamente.",
      confirmText: "Entrar al sistema",
      onConfirm: () {
        setState(() => _activeDialogData = null);
        _showToast("Sesión iniciada con éxito");
      },
    );
  }

  void _handleLogout() {
    _showCustomDialog(
      kicker: "Cerrar sesión",
      title: "Confirmar salida",
      message: "¿Estás seguro de que deseas cerrar tu sesión actual?",
      confirmText: "Cerrar sesión",
      cancelText: "Cancelar",
      onConfirm: () {
        setState(() {
          _currentUser = null;
          _currentView = 'inicio';
          _activeDialogData = null;
        });
        _showToast("Sesión cerrada correctamente");
      },
    );
  }

  void _showCustomDialog({
    required String kicker,
    required String title,
    required String message,
    required String confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
  }) {
    setState(() {
      _activeDialogData = {
        'kicker': kicker,
        'title': title,
        'message': message,
        'confirmText': confirmText,
        'cancelText': cancelText,
        'onConfirm': onConfirm,
      };
    });
  }

  void _showToast(String message) {
    setState(() => _activeToastMessage = message);
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted && _activeToastMessage == message) {
        setState(() => _activeToastMessage = null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disol Motors Injections',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFff2f55),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFff2f55),
          secondary: Color(0xFFff2f55),
          surface: Color(0xFF121214),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Color(0xFFc9bcc2)),
        ),
      ),
      home: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: _buildNavbar(context),
            ),
            drawer: _buildMobileDrawer(context),
            body: SafeArea(child: _buildCurrentView()),
            bottomNavigationBar: _buildFooter(),
          ),
          if (_activeDialogData != null)
            DmiDialog(
              dialogData: _activeDialogData!,
              onClose: () => setState(() => _activeDialogData = null),
            ),
          DmiToast(
            message: _activeToastMessage,
            onClose: () => setState(() => _activeToastMessage = null),
          ),
        ],
      ),
    );
  }

  Widget _buildNavbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFFff2f55)),
      title: InkWell(
        onTap: () => _changeView('inicio'),
        child: const Text(
          'DMI MOTORS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 16),
        ),
      ),
      actions: [
        if (_currentUser == null)
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFff2f55),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () => _changeView('login'),
                child: const Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: PopupMenuButton<String>(
                offset: const Offset(0, 40),
                color: const Color(0xFF121214),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'dashboard',
                    child: Text(_currentUser!['role'] == 'admin' ? 'Panel Admin' : 'Mi Cuenta', style: const TextStyle(color: Colors.white)),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Cerrar Sesión', style: TextStyle(color: Color(0xFFff2f55))),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'logout') {
                    _handleLogout();
                  } else {
                    _changeView(_currentUser!['role'] == 'admin' ? 'admin-dashboard' : 'user-dashboard');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFff2f55))),
                  child: Text(
                    (_currentUser!['nombre'] ?? 'CUENTA').toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF08080a),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFff2f55), width: 1.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('DISOL MOTORS', style: TextStyle(color: Color(0xFFff2f55), fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 2)),
                const SizedBox(height: 4),
                Text(_currentUser != null ? 'Sesión: ${_currentUser!['nombre']}' : 'Menú de navegación', style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFFff2f55)),
            title: const Text('INICIO', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
              _changeView('inicio');
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view, color: Color(0xFFff2f55)),
            title: const Text('CATÁLOGO', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
              _changeView('catalogo');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Color(0xFFff2f55)),
            title: const Text('CITAS', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
              _changeView('citas');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Color(0xFFff2f55)),
            title: const Text('CONTACTO', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
              _changeView('contacto');
            },
          ),
          if (_currentUser != null) ...[
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Color(0xFFff2f55)),
              title: Text(_currentUser!['role'] == 'admin' ? 'PANEL ADMIN' : 'MI CUENTA', style: const TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                _changeView(_currentUser!['role'] == 'admin' ? 'admin-dashboard' : 'user-dashboard');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.grey),
              title: const Text('CERRAR SESIÓN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              onTap: () {
                Navigator.pop(context);
                _handleLogout();
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCurrentView() {
    switch (_currentView) {
      case 'inicio':
        return HomeView(onNavigate: _changeView);
      case 'login':
        return LoginView(
          onLoginSuccess: _handleLoginSuccess,
          onSwitchToRegister: () => _changeView('registro-usuario'),
          openConfirm: (opts) => _showCustomDialog(
            kicker: opts['kicker'] ?? 'Aviso',
            title: opts['title'] ?? '',
            message: opts['message'] ?? '',
            confirmText: opts['confirmText'] ?? 'Entendido',
            onConfirm: opts['onConfirm'],
          ),
        );
      case 'registro-usuario':
        return RegisterUserView(
          onRegisterSuccess: () => _changeView('login'),
          openConfirm: (opts) => _showCustomDialog(
            kicker: opts['kicker'] ?? 'Aviso',
            title: opts['title'] ?? '',
            message: opts['message'] ?? '',
            confirmText: opts['confirmText'] ?? 'Entendido',
            onConfirm: opts['onConfirm'],
          ),
        );
      case 'catalogo':
        return CatalogView(onBack: () => _changeView('inicio'));
      case 'citas':
        return AppointmentView(
          onNeedLogin: () => _changeView('login'),
          onNeedVehicle: () => _changeView('registro'),
          onGoGarage: () => _changeView('user-dashboard'),
        );
      case 'contacto':
        return ContactView(onBack: () => _changeView('inicio'));
      case 'registro':
        return VehicleRegisterView(onComplete: () => _changeView('user-dashboard'));
      case 'user-dashboard':
        return UserDashboardView(
          onAddVehicle: () => _changeView('registro'),
          onScheduleAppointment: () => _changeView('citas'),
        );
      case 'admin-dashboard':
        return AdminDashboardView(onLogout: _handleLogout);
      default:
        return HomeView(onNavigate: _changeView);
    }
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Colors.black,
      child: const Text(
        '© 2026 - DMI - HIGH PERFORMANCE SERVICE',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 1.5),
      ),
    );
  }
}