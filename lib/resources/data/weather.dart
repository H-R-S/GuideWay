import 'package:guide_way/resources/constants/icons.dart';

List<Map<String, dynamic>> hourlyWeather = [
  {"time": "1 PM", "icon": sunIcon, "temperature": "26"},
  {"time": "2 PM", "icon": sunIcon, "temperature": "25"},
  {"time": "3 PM", "icon": sunIcon, "temperature": "24"},
  {"time": "4 PM", "icon": sunIcon, "temperature": "23"},
  {"time": "5 PM", "icon": cloudyIcon, "temperature": "20"}
];

List<Map<String, dynamic>> weeklyWeather = [
  {
    "day": "Monday",
    "icon": sunIcon,
    "dayTemperature": "26",
    "nightTemperature": "18",
    "rainChance": "0"
  },
  {
    "day": "Tuesday",
    "icon": sunIcon,
    "dayTemperature": "26",
    "nightTemperature": "18",
    "rainChance": "20"
  },
  {
    "day": "Wednesday",
    "icon": cloudyIcon,
    "dayTemperature": "23",
    "nightTemperature": "17",
    "rainChance": "36"
  },
  {
    "day": "Thursday",
    "icon": cloudyIcon,
    "dayTemperature": "22",
    "nightTemperature": "17",
    "rainChance": "40"
  },
  {
    "day": "Friday",
    "icon": thunderStromDayIcon,
    "dayTemperature": "19",
    "nightTemperature": "13",
    "rainChance": "98"
  },
  {
    "day": "Saturday",
    "icon": thunderStromDayIcon,
    "dayTemperature": "20",
    "nightTemperature": "12",
    "rainChance": "93"
  },
  {
    "day": "Sunday",
    "icon": rainyIcon,
    "dayTemperature": "20",
    "nightTemperature": "16",
    "rainChance": "78"
  }
];
