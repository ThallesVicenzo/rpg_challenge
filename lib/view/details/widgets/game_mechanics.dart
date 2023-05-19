import 'package:flutter/material.dart';

import '../../../view_model/providers/details_provider.dart';

class GameMechanics extends StatelessWidget {
  const GameMechanics({
    super.key,
    required this.mediaQuery,
    required this.theme,
    required this.detailsProvider,
  });

  final MediaQueryData mediaQuery;
  final ThemeData theme;
  final DetailsProvider detailsProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.size.height * 0.07,
      width: mediaQuery.size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '${detailsProvider.gameDetails!.caracteristicas[0].descricao} , ${detailsProvider.gameDetails!.caracteristicas[1].descricao}.',
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
