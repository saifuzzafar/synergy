
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/feature/home/home_page_model.dart';


final HomeViewModelProvider =
ChangeNotifierProvider.autoDispose<HomeViewModel>(
        (ref) => HomeViewModel()

);
