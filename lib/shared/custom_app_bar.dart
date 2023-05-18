import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.theme,
    required this.leadingFunction,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  final ThemeData theme;
  final VoidCallback leadingFunction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
      ),
      leading: IconButton(
        onPressed: leadingFunction,
        icon: Icon(
          Icons.arrow_back,
          color: theme.primaryColor,
          size: 30,
        ),
      ),
    );
  }
}
