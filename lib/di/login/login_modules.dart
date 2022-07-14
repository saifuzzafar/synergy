
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simplify_synergy_2/feature/login/login_page_model.dart';


final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>(
  (ref) => LoginViewModel()

);
