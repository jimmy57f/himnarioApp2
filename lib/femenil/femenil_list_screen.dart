// alabanzas_list_screen.dart

// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'alabanza_femenil.dart'; // Importa la clase Alabanza
import 'femenil_detail_screen.dart'; // Importa la pantalla de detalle de la alabanza
import 'data_femenil.dart'; // Importa la función fetchAlabanzas

class FemenilListScreen extends StatefulWidget {
  @override
  _FemenilListScreenState createState() => _FemenilListScreenState();
}

class _FemenilListScreenState extends State<FemenilListScreen> {
  List<Femenil> alabanzas = [];
  List<Femenil> alabanzasFiltradas = [];

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAlabanzas();
    _controller.addListener(onSearchTextChanged);
  }

  Future<void> loadAlabanzas() async {
    List<Femenil> loadedAlabanzas = await fetchAlabanzasFemeniles();
    setState(() {
      alabanzas = loadedAlabanzas;
      alabanzasFiltradas = loadedAlabanzas;
    });
  }

  void onSearchTextChanged() {
    setState(() {
      String searchText = _controller.text.toLowerCase();
      alabanzasFiltradas = alabanzas
          .where((alabanza) =>
              alabanza.numero.toString().contains(searchText) ||
              alabanza.titulo.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Convenciones Femeniles',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Buscar alabanza...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: alabanzasFiltradas.isEmpty
                ? const Center(child: Text('No se encontraron alabanzas'))
                : ListView.builder(
                    itemCount: alabanzasFiltradas.length,
                    itemBuilder: (context, index) {
                      Femenil alabanza = alabanzasFiltradas[index];
                      return Semantics(
                        label: '${alabanza.numero}. ${alabanza.titulo}',
                        button: true,
                        child: ListTile(
                          title: Text(
                            '${alabanza.numero}. ${alabanza.titulo}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FemenilDetailScreen(alabanza: alabanza),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
