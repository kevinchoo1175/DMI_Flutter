import 'package:flutter/material.dart';

class DmiDialog extends StatelessWidget {
  final Map<String, dynamic> dialogData;
  final VoidCallback onClose;

  const DmiDialog({super.key, required this.dialogData, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final handleConfirm = () {
      if (dialogData['onConfirm'] != null) {
        dialogData['onConfirm']();
      } else {
        onClose();
      }
    };

    return Stack(
      children: [
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.8),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 250),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: 0.85 + (0.15 * value),
                  child: Opacity(opacity: value, child: child),
                );
              },
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF121214),
                  border: Border.all(color: const Color(0xFFff2f55), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFff2f55).withOpacity(0.25),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (dialogData['kicker'] ?? 'CONFIRMACIÓN').toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFFff2f55),
                        letterSpacing: 2,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      dialogData['title'] ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dialogData['message'] ?? '',
                      style: const TextStyle(color: Color(0xFFc9bcc2), height: 1.4, fontSize: 12.5),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFff2f55),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                            ),
                            onPressed: handleConfirm,
                            child: Text(
                              dialogData['confirmText'] ?? 'CONFIRMAR',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        if (dialogData['cancelText'] != null) ...[
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFFff2f55)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                              ),
                              onPressed: onClose,
                              child: Text(
                                dialogData['cancelText'],
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}