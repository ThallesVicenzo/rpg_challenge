import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_challenge/shared/custom_app_bar.dart';
import 'package:rpg_challenge/view/loading_screen.dart';
import 'package:rpg_challenge/view_model/providers/details_provider.dart';
import 'package:rpg_challenge/view_model/routes/args/details_screen_args.dart';

import '../../shared/constants.dart';
import 'widgets/game_mechanics.dart';
import 'widgets/game_resume_info.dart';
import 'widgets/game_summary.dart';
import 'widgets/game_type.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: Consumer<DetailsProvider>(
        builder: (context, detailsProvider, child) => FutureBuilder(
          future: detailsProvider.getGameDetails(args.gameId!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            }
            return Scaffold(
              appBar: CustomAppBar(
                title: detailsProvider.gameDetails!.nome,
                theme: theme,
                leadingFunction: () {
                  Navigator.pop(context);
                },
              ),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(kDetailsBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.cardColor.withOpacity(0.8),
                  ),
                  child: Column(
                    children: [
                      GameResumeInfo(
                        mediaQuery: mediaQuery,
                        theme: theme,
                        detailsProvider: detailsProvider,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Descrição do jogo',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                      GameSummary(
                        mediaQuery: mediaQuery,
                        theme: theme,
                        detailsProvider: detailsProvider,
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Mecanicas',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                      GameMechanics(
                        mediaQuery: mediaQuery,
                        theme: theme,
                        detailsProvider: detailsProvider,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GameType(
                        mediaQuery: mediaQuery,
                        theme: theme,
                        detailsProvider: detailsProvider,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
