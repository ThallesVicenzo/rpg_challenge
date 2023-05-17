import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rpg_challenge/shared/constants.dart';
import 'package:rpg_challenge/view/authentication/widgets/custom_text_field.dart';
import 'package:rpg_challenge/view/authentication/widgets/validate_button.dart';
import 'package:rpg_challenge/view_model/providers/authentication_provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(kAuthBackground), fit: BoxFit.cover),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(18),
              ),
              height: mediaQueryData.size.height * 0.5,
              width: mediaQueryData.size.width * 0.8,
              child: Consumer<AuthenticationProvider>(
                builder: (context, authenticationProvider, _) =>
                    ModalProgressHUD(
                  inAsyncCall: authenticationProvider.loadingState,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Login',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            title: 'E-mail',
                            errorText: authenticationProvider.returnEmailError,
                            controller: authenticationProvider
                                .textEditingControllers[0],
                            theme: theme,
                            hintText: 'Informe seu E-mail...',
                          ),
                          CustomTextField(
                            title: 'Senha',
                            errorText:
                                authenticationProvider.returnPasswordError,
                            controller: authenticationProvider
                                .textEditingControllers[1],
                            sufixIcon: IconButton(
                              icon: Icon(
                                authenticationProvider.hideText == false
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: theme.iconTheme.color,
                                size: theme.iconTheme.size,
                              ),
                              onPressed: () {
                                authenticationProvider.updateHideText();
                              },
                            ),
                            theme: theme,
                            hideText: authenticationProvider.hideText,
                            hintText: 'Informe sua senha...',
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: AbsorbPointer(
                            absorbing: authenticationProvider.loadingState,
                            child: ValidadeButton(
                              onTap: () {
                                authenticationProvider.sendCredentials(
                                  context,
                                  widget: AlertDialog(
                                    title: Text(
                                      'Dados inválidos, tente novamente',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'OK',
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              theme: theme,
                              mediaQueryData: mediaQueryData,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
