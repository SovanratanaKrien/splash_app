class PaymentModel {
  final String transactionId;
  final String paymentMethod;
  final double amountPaid; // Added the payment amount
  final DateTime transactionDate; // Added the time of payment

  PaymentModel({
    required this.transactionId, 
    required this.paymentMethod,
    required this.amountPaid,
    required this.transactionDate,
  });
}