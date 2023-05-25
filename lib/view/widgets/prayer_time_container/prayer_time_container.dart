import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(context).size.width;
    final style = TextStyle(
        color: isHeader ? Colors.grey : null,
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
                    width: width * 0.3, child: Text(name ?? "", style: style)),
                SizedBox(
                    width: width * 0.3,
                    child: Text(azanTime ?? "",
                        style: style.copyWith(fontWeight: FontWeight.normal))),
                SizedBox(
                    width: width * 0.3,
                    child: Text(iqamaTime ?? "",
                        style: style.copyWith(fontWeight: FontWeight.normal)))
              ]));
  }
}
