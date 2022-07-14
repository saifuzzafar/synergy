

import 'package:flutter/material.dart';
import 'package:simplify_synergy_2/utils/UI_manager/ui_manager.dart';

class SynergyUIManager extends UIManager {
  SynergyUIManager(BuildContext context) : super(context);

  @override
  Size referenceModel() {
    return const Size(1920, 1940);
  }
}
