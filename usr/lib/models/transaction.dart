class Transaction {
  final String name;
  final String date;
  final String amount;
  final bool isSending;

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.isSending,
  });
}
