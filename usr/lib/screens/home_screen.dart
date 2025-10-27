import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_list_item.dart';
import 'send_money_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _transactions = [
    Transaction(name: 'John Doe', date: 'May 21, 2024', amount: '150.00', isSending: true),
    Transaction(name: 'Jane Smith', date: 'May 20, 2024', amount: '200.50', isSending: false),
    Transaction(name: 'Service Payment', date: 'May 19, 2024', amount: '25.00', isSending: true),
    Transaction(name: 'Mike Johnson', date: 'May 18, 2024', amount: '500.00', isSending: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 24),
            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Balance',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$2,540.50',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton(
          icon: Icons.arrow_upward,
          label: 'Send',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SendMoneyScreen()),
            );
          },
        ),
        _actionButton(
          icon: Icons.arrow_downward,
          label: 'Request',
          onPressed: () {
            // TODO: Implement request money functionality
          },
        ),
        _actionButton(
          icon: Icons.receipt_long,
          label: 'Bills',
          onPressed: () {
            // TODO: Implement bills functionality
          },
        ),
        _actionButton(
          icon: Icons.more_horiz,
          label: 'More',
          onPressed: () {
            // TODO: Implement more options
          },
        ),
      ],
    );
  }

  Widget _actionButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildTransactionList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        return TransactionListItem(transaction: _transactions[index]);
      },
    );
  }
}
