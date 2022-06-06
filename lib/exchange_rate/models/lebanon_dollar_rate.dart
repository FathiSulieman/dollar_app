class LebanonRate {
  final String? buyRate;
  final String? sellRate;
  final String? lastUpdatedRate;

  LebanonRate({this.buyRate, this.sellRate, this.lastUpdatedRate});

  factory LebanonRate.fromJson(Map<String, dynamic> json) {
    return LebanonRate(
        buyRate: json['buyRate'],
        sellRate: json['sellRate'],
        lastUpdatedRate: json['updatedDate']);
  }
}
