import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/main/app_viewmodel.dart';

ChangeNotifierProvider<AppViewModel> appViewModel =
    ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(),
);
