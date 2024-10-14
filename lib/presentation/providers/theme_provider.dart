
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

//lista de colores que nunca van a cambiar
final colorListProvider = StateProvider((ref) => colorList); 

//un simple int
final selectedColorProvider= StateProvider((ref) => 0);