import 'package:flutter/material.dart';

import '../../../view_model/providers/home_provider.dart';
import 'buttons/game_list_content.dart';
import 'pages_navigation.dart';

class GamesListWidget extends StatelessWidget {
  const GamesListWidget({
    super.key,
    required this.theme,
    required this.mediaQuery,
    required this.homeProvider,
  });

  final ThemeData theme;
  final MediaQueryData mediaQuery;
  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeProvider.gamesContentList!.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == homeProvider.gamesContentList!.length - 1) {
            return PagesNavigation(
              homeProvider: homeProvider,
              theme: theme,
              mediaQuery: mediaQuery,
            );
          }
          return GameListContent(
            homeProvider: homeProvider,
            theme: theme,
            mediaQuery: mediaQuery,
            index: index,
          );
        },
      ),
    );
  }
}
