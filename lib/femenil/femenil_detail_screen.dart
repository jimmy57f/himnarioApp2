// alabanza_detail_screen.dart

import 'package:flutter/material.dart';
import 'alabanza_femenil.dart'; // Importa la clase Alabanza

class FemenilDetailScreen extends StatelessWidget {
  final Femenil alabanza;

  const FemenilDetailScreen({Key? key, required this.alabanza})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          alabanza.titulo,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Semantics(
              label: 'Número de convención ${alabanza.numero}',
              child: Text(
                'Convención: ${alabanza.numero}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Semantics(
                label: 'Letra de la alabanza',
                child: Text(
                  alabanza.letra,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
