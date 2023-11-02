import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:app/Interfaces/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Listener(
          onPointerUp: (_) {
            // if (Platform.isIOS) {
            //   FocusScopeNode currentFocus = FocusScope.of(context);
            //   if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            //     FocusManager.instance.primaryFocus!.unfocus();
            //   }
            // }
          },
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
        );
      },
    );
  }
}