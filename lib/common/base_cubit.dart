import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseCubit<T> extends BlocBase<T> {
  late final BuildContext context;

  BaseCubit(super.state);

  initialize(
    BuildContext context, {
    dynamic params,
  }) {
    this.context = context;
  }

  void showSnackbar({
    required String title,
    required String message,
    required ContentType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: type,
        ),
      ),
    );
  }

  void showSomethingWentWrong() {
    showSnackbar(
      title: 'Something went wrong...',
      message: 'Please try again',
      type: ContentType.warning,
    );
  }
}
