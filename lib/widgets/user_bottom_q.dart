
import 'package:flutter/material.dart';

import '../Screens/signup_screen.dart';

class UserBottomQ extends StatelessWidget {
  const UserBottomQ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "don't have an account",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUp.id);
          },
          child: const Text(
            ' Sign Up',
            style: TextStyle(
              color: Colors.yellowAccent,
            ),
          ),
        ),
      ],
    );
  }
}
