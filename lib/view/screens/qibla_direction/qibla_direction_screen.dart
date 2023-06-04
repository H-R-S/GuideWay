import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import '../../../resources/constants/icons.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class QiblaDirectionScreen extends StatefulWidget {
  const QiblaDirectionScreen({super.key});

  @override
  State<QiblaDirectionScreen> createState() => _QiblaDirectionScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblaDirectionScreenState extends State<QiblaDirectionScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(color: isDark ? Colors.white : null, fontSize: 20);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Qibla Direction"),
        body: FutureBuilder(
            future: getPermission(),
            builder: (context, snapshot) {
              if (!hasPermission) {
                return Center(
                    child: Text("Location permission denied", style: style));
              } else {
                return StreamBuilder(
                    stream: FlutterQiblah.qiblahStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ));
                      } else {
                        final qiblahDirection = snapshot.data;

                        animation = Tween(
                                begin: begin,
                                end:
                                    (qiblahDirection!.qiblah * (pi / 180) * -1))
                            .animate(_animationController!);
                        begin = (qiblahDirection.qiblah * (pi / 180) * -1);
                        _animationController!.forward(from: 0);

                        return Padding(
                            padding: const EdgeInsets.all(20).copyWith(top: 40),
                            child: Column(children: [
                              Text("${qiblahDirection.direction.toInt()}°",
                                  style: TextStyle(
                                      color: isDark ? Colors.white : null,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Container(
                                  decoration: BoxDecoration(
                                      color:
                                          isDark ? null : Colors.grey.shade400,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10)
                                          .copyWith(bottom: 3),
                                      child: AnimatedBuilder(
                                          animation: animation!,
                                          builder: (context, child) =>
                                              Transform.rotate(
                                                  angle: animation!.value,
                                                  child: Image.asset(
                                                      qiblaCompasIcon)))))
                            ]));
                      }
                    });
              }
            }));
  }
}
