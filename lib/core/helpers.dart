import 'package:fanme_flutter/views/widgets/common/bottomsheet.dart';
import 'package:flutter/material.dart';

class Helpers {
  Helpers();

  Helpers.showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BottomSheetContainer(),
    );
  }
}
