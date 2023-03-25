import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotato/widgets/white_elevated_button.dart';

class ConfirmationMessageWidget extends ConsumerWidget {
  const ConfirmationMessageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        children: [
          Container(
            child: const Icon(Icons.done),
          ),
          Column(
            children: const [
              Text('Terminé'),
              Text(
                  'Vous pouvez disposer et consulter votre solde pour le paiement de votre client.'),
            ],
          ),
          const WhiteElevatedButton(),
        ],
      ),
    );
  }
}
