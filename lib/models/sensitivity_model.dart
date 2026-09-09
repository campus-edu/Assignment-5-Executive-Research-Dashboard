import 'dart:math';

class SensitivityModel {
  double aov;
  double throughput;
  double commissionRate;

  SensitivityModel({
    this.aov = 38.50,
    this.throughput = 2.8,
    this.commissionRate = 22.0,
  });

  static const double customerDeliveryFee = 3.99;
  static const double baseCourierHourly = 18.00;
  static const int annualOrders = 1680000;

  double get grossPlatformRevenue =>
      (aov * (commissionRate / 100.0)) + customerDeliveryFee;

  double get driverFulfillmentCost =>
      throughput > 0 ? (baseCourierHourly / throughput) : 0.0;

  double get paymentGateway =>
      (0.029 * (aov + customerDeliveryFee)) + 0.30;

  double get netContribution =>
      grossPlatformRevenue - driverFulfillmentCost - paymentGateway;

  double get netTakeRate =>
      aov > 0 ? ((grossPlatformRevenue / aov) * 100.0) : 0.0;

  double get projectedArr =>
      (annualOrders * grossPlatformRevenue) / 1000000.0;

  double get grossMargin =>
      grossPlatformRevenue > 0
          ? ((netContribution / grossPlatformRevenue) * 100.0)
          : 0.0;

  double get cashRunwayMonths {
    const monthlyOrders = annualOrders / 12.0;
    final monthlyNetGross = monthlyOrders * netContribution;
    final netBurn = max(25000.0, 140000.0 - monthlyNetGross);
    return min(36.0, max(6.0, 2000000.0 / netBurn));
  }
}
