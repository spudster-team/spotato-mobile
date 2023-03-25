import 'package:flutter/material.dart';

import '../constants.dart';

class WhiteElevatedButton extends StatelessWidget {
  const WhiteElevatedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Palette.primaryColor,
      ),
      onPressed: () {},
      child: const Text(
        'Accepter',
        style: TextStyle(
          color: Palette.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}