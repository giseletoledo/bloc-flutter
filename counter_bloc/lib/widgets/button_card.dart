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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(left: 14, bottom: 12),
        color: const Color.fromARGB(145, 48, 156, 250),
        child: SizedBox(
            width: 170,
            height: 170,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                    color: Color.fromARGB(255, 247, 245, 249),
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
