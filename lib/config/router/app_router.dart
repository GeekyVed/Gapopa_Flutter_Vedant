import 'package:gapopa_flutter_vedant/features/dock/presentation/screens/home_screen.dart';
import 'package:gapopa_flutter_vedant/features/dock/presentation/widgets/dock_settings_panel.dart';
import 'package:get/get.dart';

class AppRouter {
  static const home = '/';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: settings, page: () => const DockSettingsPanel()),
  ];
}
