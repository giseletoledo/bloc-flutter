import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color.fromARGB(110, 108, 180, 242),
      child: SizedBox(
          width: 170,
          height: 170,
          child: Center(
            child: GestureDetector(
                onTap: onTap,
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 247, 245, 249),
                      fontWeight: FontWeight.bold),
                )),
          )),
    );
  }
}
