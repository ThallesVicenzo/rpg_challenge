import 'package:flutter/material.dart';
import 'package:rpg_challenge/view/home/widgets/buttons/see_more_button.dart';
import 'package:rpg_challenge/view_model/providers/home_provider.dart';
import 'package:rpg_challenge/view_model/providers/pages_provider.dart';
import 'package:rpg_challenge/view_model/routes/args/details_screen_args.dart';
import 'package:rpg_challenge/view_model/routes/named_routes.dart';

class GamesListWidget extends StatelessWidget {
  const GamesListWidget({
    super.key,
    required this.theme,
    required this.mediaQuery,
    required this.homeProvider,
    required this.pagesProvider,
  });

  final ThemeData theme;
  final MediaQueryData mediaQuery;
  final HomeProvider homeProvider;
  final PagesProvider pagesProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeProvider.gamesList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == homeProvider.gamesList.length - 1) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              child: SeeMoreButton(
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                pagesProvider: pagesProvider,
              ),
            );
          }
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                NamedRoutes.details,
                arguments: DetailsScreenArgs(
                  gameId: homeProvider.gamesList[index].id,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.network(
                      homeProvider.gamesList[index].urlCapa,
                      filterQuality: FilterQuality.high,
                      width: mediaQuery.size.width * 0.25,
                      height: mediaQuery.size.height * 0.15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            homeProvider.gamesList[index].nome,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              color: theme.primaryColor,
                            ),
                          ),
                          Text(
                            homeProvider.gamesList[index].ano,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
