import 'package:flutter/material.dart';

import '../../../view_model/providers/details_provider.dart';

class GameSummary extends StatelessWidget {
  const GameSummary({
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
      height: mediaQuery.size.height * 0.15,
      width: mediaQuery.size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  detailsProvider.gameDetails!.descricao,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
