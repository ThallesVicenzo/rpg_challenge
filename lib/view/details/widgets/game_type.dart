import 'package:flutter/material.dart';

import '../../../view_model/providers/details_provider.dart';

class GameType extends StatelessWidget {
  const GameType({
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
      width: mediaQuery.size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(color: theme.primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: detailsProvider.returnTextWidget(theme),
      ),
    );
  }
}
