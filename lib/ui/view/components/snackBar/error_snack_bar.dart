import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {
  final String message;
  final BuildContext context;
  ErrorSnackBar({
    Key? key,
    required this.message,
    required this.context
  }) : super(
    content: Row(
      children: [
        Container(
          width: 280,
          child: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ),
        Expanded(
          child: Container(
            height: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 24,
            width: 24,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.red.shade300,
    margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
    behavior: SnackBarBehavior.floating,
  );
}