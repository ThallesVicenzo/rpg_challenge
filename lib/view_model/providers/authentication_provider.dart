import 'package:flutter/material.dart';
import 'package:rpg_challenge/view_model/repositories/local_data_base_repository.dart';
import 'package:rpg_challenge/view_model/routes/named_routes.dart';

import '../repositories/api_repository.dart';

class AuthenticationProvider with ChangeNotifier {
  final textEditingControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  String? returnEmailError;
  String? returnPasswordError;
  bool hideText = true;
  bool loadingState = false;

  Future<String?> emailErrorText() async {
    String text = textEditingControllers[0].value.text;
    if (text != 'candidato@tabulero.com.br') {
      return 'Email inválido';
    }

    return null;
  }

  Future<String?> passwordErrorText() async {
    String text = textEditingControllers[1].value.text;

    if (text != '123456') {
      return 'Senha inválida';
    }

    return null;
  }

  void updateErrorText({String? passwordErrorText, String? emailErrorText}) {
    returnEmailError = emailErrorText;
    returnPasswordError = passwordErrorText;
    notifyListeners();
  }

  void updateHideText() {
    hideText = !hideText;
    notifyListeners();
  }

  Future<void> sendCredentials(context, {required Widget widget}) async {
    String? emailError = await emailErrorText();
    String? passwordError = await passwordErrorText();

    updateErrorText(
        passwordErrorText: passwordError, emailErrorText: emailError);
    if (emailError == null && passwordError == null) {
      loadingState = true;

      await ApiRepository.sendData(
        textEditingControllers[0].value.text,
        textEditingControllers[1].value.text,
      ).then(
        (value) {
          notifyListeners();
          LocalDataBaseRepository.callSaveData(value!).whenComplete(
            () {
              loadingState = false;

              Navigator.pushReplacementNamed(context, NamedRoutes.home);
            },
          );
        },
      );
    } else {
      notifyListeners();
    }
  }
}
