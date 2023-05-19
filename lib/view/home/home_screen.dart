import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_challenge/shared/constants.dart';
import 'package:rpg_challenge/view/home/widgets/games_list_widget.dart';
import 'package:rpg_challenge/view/home/widgets/logout_widget.dart';
import 'package:rpg_challenge/view_model/providers/home_provider.dart';
import 'package:rpg_challenge/view_model/providers/splash_screen_provider.dart';

import '../../shared/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => WillPopScope(
          onWillPop: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return LogoutWidget(
                    theme: theme,
                    homeProvider: homeProvider,
                    splashScreenProvider: splashScreenProvider,
                  );
                });
            return true;
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'RPG Challenge',
              theme: theme,
              leadingFunction: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return LogoutWidget(
                        theme: theme,
                        homeProvider: homeProvider,
                        splashScreenProvider: splashScreenProvider,
                      );
                    });
              },
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kMainBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: FutureBuilder(
                  future: homeProvider.getGamesList(page: homeProvider.page),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        GamesListWidget(
                          theme: theme,
                          mediaQuery: mediaQuery,
                          homeProvider: homeProvider,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
