import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const GeradorQrApp());
}

class GeradorQrApp extends StatelessWidget {
  const GeradorQrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerador de QR Code',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const GeradorQrPage(),
    );
  }
}

class GeradorQrPage extends StatefulWidget {
  const GeradorQrPage({super.key});

  @override
  State<GeradorQrPage> createState() => _GeradorQrPageState();
}

class _GeradorQrPageState extends State<GeradorQrPage> {
  final TextEditingController controller = TextEditingController();

  String textoQr = '';

  void gerarQrCode() {
    setState(() {
      textoQr = controller.text.trim();
    });
  }

  void limpar() {
    setState(() {
      controller.clear();
      textoQr = '';
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de QR Code'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Icon(
                Icons.qr_code_2,
                size: 80,
              ),

              const SizedBox(height: 20),

              const Text(
                'Digite um texto ou link para gerar um QR Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Texto ou link',
                  hintText: 'Ex: https://www.google.com',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: gerarQrCode,
                      icon: const Icon(Icons.qr_code),
                      label: const Text('Gerar QR Code'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: limpar,
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('Limpar'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              if (textoQr.isNotEmpty) ...[
                const Text(
                  'QR Code gerado:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: QrImageView(
                    data: textoQr,
                    version: QrVersions.auto,
                    size: 220,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Conteúdo do QR Code:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  textoQr,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}