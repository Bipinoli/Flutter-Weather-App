DateTime getDateTime(int timestampInSeconds, int timezone) {
  // return DateTime as in the given timezone
  return DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000,
          isUtc: true)
      .add(Duration(seconds: timezone));
}

double getPercentCover(
    {DateTime dateTime, DateTime minDateTime, DateTime maxDateTime}) {
  if (dateTime.isBefore(minDateTime)) return 0.0;
  if (dateTime.isAfter(maxDateTime)) return 1.0;
  return dateTime.difference(minDateTime).inSeconds /
      maxDateTime.difference(minDateTime).inSeconds;
}
