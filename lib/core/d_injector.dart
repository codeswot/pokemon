import 'package:pokemon/core/services.dart';

class Di {
  final NavigationServices navigationServices = NavigationServices();
  final ApiServices apiServices = ApiServices();
}

final di = Di();
