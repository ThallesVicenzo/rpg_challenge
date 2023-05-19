import 'package:flutter/material.dart';

import '../../../view_model/providers/details_provider.dart';

class GameResumeInfo extends StatelessWidget {
  const GameResumeInfo({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              detailsProvider.gameDetails!.urlCapa,
              scale: 1.2,
            ),
            SizedBox(
              width: mediaQuery.size.width * 0.9,
              child: Center(
                child: Text(
                  detailsProvider.gameDetails!.nome,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '📅 ${detailsProvider.gameDetails!.ano}',
              softWrap: false,
              maxLines: 3,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.primaryColor,
                fontSize: 20,
              ),
            ),
            Text(
              '🧙‍♂️ de ${detailsProvider.gameDetails!.minimoJogadores} até ${detailsProvider.gameDetails!.maximoJogadores} pessoas',
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColor, fontSize: 18),
            ),
            Text(
              '🕒 ${detailsProvider.gameDetails!.duracaoMedia} min',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.primaryColor,
                fontSize: 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}
