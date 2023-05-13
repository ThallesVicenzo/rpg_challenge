import 'package:flutter/material.dart';

class ValidadeButton extends StatelessWidget {
  const ValidadeButton({
    super.key,
    required this.onTap,
    required this.theme,
    required this.mediaQueryData,
  });

  final VoidCallback onTap;
  final ThemeData theme;
  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: mediaQueryData.size.height * 0.07,
        width: mediaQueryData.size.width * 0.3,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Entrar',
            style: theme.textTheme.bodyMedium!,
          ),
        ),
      ),
    );
  }
}
