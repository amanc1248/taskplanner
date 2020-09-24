class AllGoalsStore {
  final String topic;
  final String missionNumber;
  final int totalDays;
  final int streakDays;
  final double successRate;
  final int totalTimeDone;
  final String dateTime;
  AllGoalsStore(
      {this.missionNumber,
      this.streakDays,
      this.successRate,
      this.topic,
      this.totalDays,
      this.totalTimeDone,
      this.dateTime});
}
