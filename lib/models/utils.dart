DateTime getDateTime(int timestampInSeconds) {
  return DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
}

double getPercentCover(
    {DateTime dateTime, DateTime minDateTime, DateTime maxDateTime}) {
  if (dateTime.isBefore(minDateTime)) return 0.0;
  if (dateTime.isAfter(maxDateTime)) return 1.0;
  return dateTime.difference(minDateTime).inSeconds /
      maxDateTime.difference(minDateTime).inSeconds;
}
