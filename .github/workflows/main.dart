import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _S();
}

class _S extends State<Home> {
  bool factorMode = true;
  double grains = 124;
  double velocitat = 320;
  double factorObjectiu = 125;

  double get fps => velocitat * 3.28084;
  double get factor => grains * fps / 1000;
  double get velocitatMinima =>
      ((factorObjectiu * 1000) / grains) / 3.28084;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Factor IPSC')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => factorMode = true),
                    child: const Text('Factor'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => factorMode = false),
                    child: const Text('Velocitat'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Pes (grains)',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) =>
                  setState(() => grains = double.tryParse(v) ?? grains),
            ),
            const SizedBox(height: 12),
            if (factorMode) ...[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Velocitat (m/s)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) =>
                    setState(() => velocitat = double.tryParse(v) ?? velocitat),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const Text('Factor'),
                      Text(
                        factor.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${fps.toStringAsFixed(0)} ft/s'),
                      Icon(
                        factor >= 125
                            ? Icons.check_circle
                            : Icons.cancel,
                        color:
                            factor >= 125 ? Colors.green : Colors.red,
                        size: 44,
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Factor objectiu',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => setState(() =>
                    factorObjectiu = double.tryParse(v) ?? factorObjectiu),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const Text('Velocitat mínima'),
                      Text(
                        '${velocitatMinima.toStringAsFixed(1)} m/s',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${(velocitatMinima * 3.28084).toStringAsFixed(0)} ft/s',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
