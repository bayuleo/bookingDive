import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class ButtonImageWidget extends StatelessWidget {
  final Widget image;
  final Function onTap;
  final bool isFullWidht;
  const ButtonImageWidget({
    Key? key,
    required this.image,
    required this.onTap,
    this.isFullWidht = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onTap(),
      style: OutlinedButton.styleFrom(
        primary: AppTheme.of(context).white,
        minimumSize: isFullWidht ? const Size.fromHeight(50) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(color: AppTheme.of(context).black10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: image,
      ),
    );
  }
}
