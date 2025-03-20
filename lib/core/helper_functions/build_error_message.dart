import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../widget/custom_snackbar.dart';

void buildErrorBar(BuildContext context, String errorMessage) {
  CustomSnackbar.show(
    context: context,
    title: 'حدث خطاء',
    message: errorMessage,
    type: ContentType.failure,
  );
}