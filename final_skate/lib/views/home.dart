import 'package:final_skate/common/theme.dart';
import 'package:final_skate/views/dashboard/AddingClient.dart';
import 'package:final_skate/views/dashboard/View.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class homepage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  homepage({required this.index});
  int index;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
              key: _key,
              appBar: isSmallScreen
                  ? AppBar(
                      backgroundColor: canvasColor,
                      // title: Text(_getTitleByIndex(_controller.selectedIndex)),
                      leading: IconButton(
                        onPressed: () {
                          // if (!Platform.isAndroid && !Platform.isIOS) {
                          //   _controller.setExtended(true);
                          // }
                          _key.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    )
                  : null,
              drawer: drawer(controller: _controller),
              body: (widget.index == 0
                  ? Viewtabs(isSmallScreen)
                  : addtabs(isSmallScreen))
              // Viewtabs(isSmallScreen),
              );
        },
      ),
    );
  }

  Row Viewtabs(bool isSmallScreen) {
    return Row(
      children: [
        if (!isSmallScreen) drawer(controller: _controller),
        const Expanded(
            child: Center(
          child: ViewClient(),
          // child: Center(
          //   child: _viewtabscreen(
          //       _controller, ViewClient(controller: _controller)),
          // ),
        )),
      ],
    );
  }

  Row addtabs(bool isSmallScreen) {
    return Row(
      children: [
        if (!isSmallScreen) drawer(controller: _controller),
        const Expanded(
            child: Center(
          child: addingClient(),
          // child: Center(
          //   child: _viewtabscreen(
          //       _controller, ViewClient(controller: _controller)),
          // ),
        )),
      ],
    );
  }
}

// _viewtabscreen(SidebarXController controller) {
//   return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         final theme = Theme.of(context);
//         // final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         // switch (controller.selectedIndex) {
//         //   case 0:
//         return ViewClient(
//           controller: controller,
//         );
//         // default:
//         //   return Text(
//         //     "Title",
//         //     // pageTitle,
//         //     style: theme.textTheme.headlineSmall,
//         //   );
//       }
//       // return

//       );
// }

// class tabscreen extends StatelessWidget {
//   const tabscreen({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         // final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         switch (controller.selectedIndex) {
//           case 0:
//             return ViewClient();
//           default:
//             return Text(
//               "Title",
//               // pageTitle,
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//         // return
//       },
//     );
//   }
// }

class drawer extends StatefulWidget {
  const drawer({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return const Text('Image');
        // return SizedBox(
        //   height: 100,
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Image.asset('assets/images/avatar.png'),
        //   ),
        // );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.search,
          label: 'Search',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'People',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorites',
        ),
        const SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'Flutter',
        ),
      ],
    );
  }
}
