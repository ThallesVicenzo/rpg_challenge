import 'package:flutter/material.dart';
import 'package:rpg_challenge/shared/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardColor.withOpacity(1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(kLoading, scale: 2),
              Text(
                'Loading...',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              const CircularProgressIndicator()
            ],
          ),
        ],
      ),
    );
  }
}
