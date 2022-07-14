import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:simplify_synergy_2/base/base_page_view_model.dart';
import 'package:simplify_synergy_2/utils/extension/stream_extention.dart';

class SplashViewModel extends BasePageViewModel {
  ///linear progress bar progress holder subject
  final BehaviorSubject<double> _splashProgressSubject =
      BehaviorSubject.seeded(0.0);

  Stream<double> get splashProgressStream => _splashProgressSubject.stream;

  /// Timer logic to trigger after 1 sec
  startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == 4) {
        _splashProgressSubject.safeAdd(1.0);
        timer.cancel();
      } else {
        _splashProgressSubject.safeAdd(_splashProgressSubject.value + 0.25);
      }
    });
  }

  @override
  void dispose() {
    _splashProgressSubject.close();
    super.dispose();
  }
}
