import 'package:flutter/material.dart';

class DmiToast extends StatelessWidget {
  final String? message;
  final VoidCallback onClose;

  const DmiToast({super.key, required this.message, required this.onClose});

  @override
  Widget build(BuildContext context) {
    if (message == null) return const SizedBox.shrink();

    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF08080a).withOpacity(0.96),
              border: Border.all(color: const Color(0xFFff2f55)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFff2f55).withOpacity(0.2),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(width: 4, height: 35, color: const Color(0xFFff2f55)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'AVISO DMI',
                        style: TextStyle(color: Color(0xFFff2f55), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                      ),
                      const SizedBox(height: 2),
                      Text(message!, style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 14, color: Colors.white54),
                  onPressed: onClose,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}