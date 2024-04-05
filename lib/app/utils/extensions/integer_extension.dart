extension IntegerExtension on int {
  String get formatSeconds {
    int hours = this ~/ 3600;
    int remainingSeconds = this % 3600;
    int minutes = remainingSeconds ~/ 60;
    remainingSeconds = remainingSeconds % 60;

    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

    if (hours > 0) {
      return '$formattedHours:$formattedMinutes:$formattedSeconds';
    } else {
      return '$formattedMinutes:$formattedSeconds';
    }
  }
}
