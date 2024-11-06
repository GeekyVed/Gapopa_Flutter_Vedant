import 'package:flutter_test/flutter_test.dart';
//import 'package:integration_test/integration_test.dart';
import 'package:gapopa_flutter_vedant/main.dart' as app;

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Basic integration test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
  });
}
