import 'package:flutter/material.dart';

import '../../../../view_model/providers/home_provider.dart';
import '../../../../view_model/routes/args/details_screen_args.dart';
import '../../../../view_model/routes/named_routes.dart';

class GameListContent extends StatelessWidget {
  const GameListContent({
    super.key,
    required this.homeProvider,
    required this.theme,
    required this.mediaQuery,
    required this.index,
  });

  final HomeProvider homeProvider;
  final ThemeData theme;
  final MediaQueryData mediaQuery;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          NamedRoutes.details,
          arguments: DetailsScreenArgs(
            gameId: homeProvider.gamesContentList![index].id,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: theme.cardColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  homeProvider.gamesContentList![index].urlCapa,
                  filterQuality: FilterQuality.high,
                  width: mediaQuery.size.width * 0.25,
                  height: mediaQuery.size.height * 0.15,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: mediaQuery.size.width * 0.6,
                    child: Center(
                      child: Text(
                        homeProvider.gamesContentList![index].nome,
                        softWrap: true,
                        maxLines: 2,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    homeProvider.gamesContentList![index].ano,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
