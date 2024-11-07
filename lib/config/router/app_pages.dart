import 'package:gapopa_flutter_vedant/config/router/app_routes.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/home_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  ];
}
