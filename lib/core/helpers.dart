import 'package:flutter/material.dart';

class Helpers {
  Helpers();

  Helpers.showBottomSheet(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => bottomSheet,
    );
  }

  Helpers.showBottomSheetModal(BuildContext context, Widget bottomSheet) {
    Helpers.showBottomSheet(context, bottomSheet);
  }
}
