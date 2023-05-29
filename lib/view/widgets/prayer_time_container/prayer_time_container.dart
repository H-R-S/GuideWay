import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class PrayerTimeContainer extends StatelessWidget {
  final String? name, azanTime, iqamaTime;
  final bool isHeader;

  const PrayerTimeContainer(
      {super.key,
      this.isHeader = false,
      this.name,
      this.azanTime,
      this.iqamaTime});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    double width = MediaQuery.of(context).size.width;
    final style = TextStyle(
        color: isDark && isHeader
            ? Colors.white
            : isHeader
                ? Colors.grey
                : null,
        fontSize: 18,
        fontWeight: FontWeight.bold);

    return Padding(
        padding: EdgeInsets.symmetric(vertical: isHeader ? 20 : 10),
        child: isHeader
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    width: width * 0.3, child: Text("Prayer", style: style)),
                SizedBox(
                    width: width * 0.3, child: Text("Adhan", style: style)),
                SizedBox(width: width * 0.3, child: Text("Iqama", style: style))
              ])
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    width: width * 0.3,
                    child: Text(name ?? "",
                        style: style.copyWith(
                            color: isDark ? Colors.grey : null))),
                SizedBox(
                    width: width * 0.3,
                    child: Text(azanTime ?? "",
                        style: style.copyWith(
                            color: isDark ? Colors.grey : null,
                            fontWeight: FontWeight.normal))),
                SizedBox(
                    width: width * 0.3,
                    child: Text(iqamaTime ?? "",
                        style: style.copyWith(
                            color: isDark ? Colors.grey : null,
                            fontWeight: FontWeight.normal)))
              ]));
  }
}
