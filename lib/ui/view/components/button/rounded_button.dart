import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundedButton extends ConsumerWidget {
  final String text;
  final int textColor;
  final int backgroundColor;
  final bool buttonActive;
  final bool buttonLoading;
  final Future<void>Function(WidgetRef, BuildContext)? onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonActive,
    required this.buttonLoading,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      child: Center(
        child: SizedBox(
          width: size.width * 1,
          height: size.height * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(backgroundColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: buttonActive ? () => {
              onPressed!(ref, context)
              // _register(ref, context)
            } : null,
            child: (() {
              if(!buttonLoading) {
                return Text(
                  text,
                  style: TextStyle(
                    color: Color(textColor),
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  ), 
                );
              } else {
                return SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: Color(textColor),
                    backgroundColor: Color(backgroundColor)
                  ),
                );
              }
            })()
          ),
        )
      )
    );
  }
}