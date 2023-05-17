import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_challenge/shared/constants.dart';
import 'package:rpg_challenge/view/home/widgets/games_list_widget.dart';
import 'package:rpg_challenge/view/home/widgets/logout_widget.dart';
import 'package:rpg_challenge/view_model/providers/home_provider.dart';
import 'package:rpg_challenge/view_model/providers/splash_screen_provider.dart';

import '../loading_screen.dart';

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
          child: FutureBuilder(
              future: homeProvider.getGamesList(page: 0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingScreen();
                }
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'RPG Challenge',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.primaryColor),
                    ),
                    leading: IconButton(
                      onPressed: () {
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: theme.primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                  body: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(kMainBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        GamesListWidget(
                          theme: theme,
                          mediaQuery: mediaQuery,
                          homeProvider: homeProvider,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
