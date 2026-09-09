class RegulatoryWeights {
  double workerClassification;
  double feeCaps;
  double aiTransparency;
  double permitting;
  double preemption;

  RegulatoryWeights({
    this.workerClassification = 25.0,
    this.feeCaps = 25.0,
    this.aiTransparency = 20.0,
    this.permitting = 15.0,
    this.preemption = 15.0,
  });

  double get totalWeight =>
      workerClassification + feeCaps + aiTransparency + permitting + preemption;

  double calculateStateScore(List<double> stateScores) {
    if (totalWeight <= 0) return 0.0;
    final weightedSum = (stateScores[0] * workerClassification) +
        (stateScores[1] * feeCaps) +
        (stateScores[2] * aiTransparency) +
        (stateScores[3] * permitting) +
        (stateScores[4] * preemption);
    return weightedSum / totalWeight;
  }

  static const List<double> texasBase = [9.5, 10.0, 9.0, 9.0, 9.5];
  static const List<double> coloradoBase = [7.0, 9.0, 6.5, 7.5, 6.5];
  static const List<double> californiaBase = [4.0, 3.5, 6.0, 4.0, 3.0];
}
