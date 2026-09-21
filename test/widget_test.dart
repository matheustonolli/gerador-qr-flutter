import 'package:flutter_test/flutter_test.dart';
import 'package:gerador_qr/main.dart';

void main() {
  testWidgets('Aplicativo inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const GeradorQrApp());

    expect(find.text('Gerador de QR Code'), findsOneWidget);
  });
}