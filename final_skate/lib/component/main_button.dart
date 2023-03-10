import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:final_skate/common/theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            height: 50,
            width: double.infinity,
            foregroundDecoration: isLoading
                ? const BoxDecoration(
                    color: Colors.grey,
                    backgroundBlendMode: BlendMode.saturation,
                  )
                : null,
            decoration: BoxDecoration(
              color: canvasColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
                child: isLoading
                    ? const SpinKitThreeBounce(
                        color: scaffoldBackgroundColor,
                        size: 30.0,
                      )
                    : Text(
                        text,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ))));
  }
}
