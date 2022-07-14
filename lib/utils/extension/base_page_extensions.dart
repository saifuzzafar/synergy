import 'package:fluttertoast/fluttertoast.dart';
import 'package:simplify_synergy_2/base/base_page.dart';
import 'package:simplify_synergy_2/ui/molecules/app_toast.dart';

extension PageExtensions on BaseStatefulPage {
  showShortToast(String message) {
    AppToast.showToast(message, duration: Toast.LENGTH_SHORT);
  }

  showLongToast(String message) {
    AppToast.showToast(message, duration: Toast.LENGTH_LONG);
  }
}
