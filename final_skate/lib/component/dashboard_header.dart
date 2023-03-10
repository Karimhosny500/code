import 'package:final_skate/common/responsive.dart';
import 'package:final_skate/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:final_skate/router/routes_name.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
        if (!Responsive.isMobile(context))
          const Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontFamily: 'Poppins',
            ),
          ),
      ],
    );
  }
}
