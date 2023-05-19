import 'package:flutter/material.dart';

import '../../../view_model/providers/home_provider.dart';
import 'buttons/pages_button.dart';

class PagesNavigation extends StatelessWidget {
  const PagesNavigation({
    super.key,
    required this.homeProvider,
    required this.theme,
    required this.mediaQuery,
  });

  final HomeProvider homeProvider;
  final ThemeData theme;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PagesButton(
                title: '<<',
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                onTap: () async {
                  await homeProvider.updatePage(goToPageOne: true);
                },
              ),
              Visibility(
                visible: homeProvider.definePageButtonsVisibility(),
                child: PagesButton(
                  title: '${homeProvider.page - 1}',
                  homeProvider: homeProvider,
                  themeData: theme,
                  mediaQueryData: mediaQuery,
                  onTap: () async {
                    await homeProvider.updatePage(goToPreviousPage: true);
                  },
                ),
              ),
              PagesButton(
                title: '${homeProvider.page}',
                isCurrentPage: true,
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                onTap: () {},
              ),
              PagesButton(
                title: '${homeProvider.page + 1}',
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                onTap: () async {
                  await homeProvider.updatePage(goToNextPage: true);
                },
              ),
              PagesButton(
                title: '${homeProvider.page + 2}',
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                onTap: () async {
                  await homeProvider.updatePage(goUpTwoPages: true);
                },
              ),
              PagesButton(
                title: '${homeProvider.page + 3}',
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                onTap: () async {
                  await homeProvider.updatePage(goUpThreePages: true);
                },
              ),
              PagesButton(
                title: '${homeProvider.page + 4}',
                homeProvider: homeProvider,
                themeData: theme,
                mediaQueryData: mediaQuery,
                onTap: () async {
                  await homeProvider.updatePage(goUpFourPages: true);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
