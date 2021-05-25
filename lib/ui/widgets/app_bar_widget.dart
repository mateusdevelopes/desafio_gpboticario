import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final Color titleColor;
  final Function onPressed;
  final Widget leading;
  final List<Widget> actions;

  @override
  final Size preferredSize;

  AppBarWidget(
      {Key key,
      this.backgroundColor = DesignColors.COLOR_BACKGROUND,
      this.title = "",
      this.titleColor = DesignColors.COLOR_DARK_BLACK,
      this.onPressed,
      this.leading,
      this.actions})
      : preferredSize = const Size(0, 70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      leading: leading,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: DesignColors.COLOR_DARK_BLACK,
      ),
      title: Text(
        title,
        maxLines: 2,
        style: TextStyle(
          color: titleColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }
}
