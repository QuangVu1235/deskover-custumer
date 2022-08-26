import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../ui_colors.dart';

class LoadingDialog extends StatelessWidget {
  final double? elevation;
  final double height;
  final double? width;
  final EdgeInsets? insetPadding;
  final Color? backgroundColor;
  final String message;
  const LoadingDialog({
    Key? key,
    this.elevation,
    this.height = 96,
    this.width,
    this.insetPadding,
    this.backgroundColor,
    this.message = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if(message.isNotEmpty)
            LoadingAnimationWidget.inkDrop(
              color: UIColors.brandA,
              size: 50,
            ),
            if(message.isEmpty)
            LoadingAnimationWidget.inkDrop(
              color: UIColors.white,
              size: 50,
            ),
            if(message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message, style: const TextStyle(fontSize: 16, color: UIColors.brandA,fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
              ),
          ],
        ),
      );

  // => AlertDialog(
  //   backgroundColor: backgroundColor,
  //   insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  //   title: SizedBox(
  //     height: height,
  //     width: width,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         LoadingAnimationWidget.twistingDots(
  //           leftDotColor: const Color(0xFF1A1A3F),
  //           rightDotColor: const Color(0xFFEA3799),
  //           size:50
  //         ),
  //         if(message.isNotEmpty)
  //           Text(message, style: const TextStyle(fontSize: 16, color: UIColors.brandA), textAlign: TextAlign.center,),
  //       ],
  //     ),
  //   ),
  //   elevation: elevation,
  // );
}
