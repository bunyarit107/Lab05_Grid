import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Dashboard',
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<Map<String, dynamic>> cards = const [
    {
      "title": "ยอดขาย",
      "value": "120,000 บาท",
      "icon": Icons.account_balance_wallet_rounded,
      "color": Colors.teal
    },
    {
      "title": "ผู้ใช้",
      "value": "850 คน",
      "icon": Icons.supervised_user_circle_rounded,
      "color": Colors.blueAccent
    },
    {
      "title": "คำสั่งซื้อ",
      "value": "350 รายการ",
      "icon": Icons.shopping_bag_rounded, 
      "color": Colors.deepOrange 
    },
    {
      "title": "รายได้",
      "value": "250,000 บาท",
      "icon": Icons.insights_rounded,
      "color": Colors.deepPurple 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard สถิติ", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;
          String mode;

          if (constraints.maxWidth < 600) {
            crossAxisCount = 1;
            mode = "📱 Mobile";
          } else if (constraints.maxWidth < 900) {
            crossAxisCount = 2;
            mode = "💻 Tablet";
          } else {
            crossAxisCount = 4;
            mode = "🖥 Desktop";
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "โหมดปัจจุบัน : $mode",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: cards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.4,
                    ),
                    itemBuilder: (context, index) {
                      final item = cards[index];

                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                item["icon"],
                                size: 44,
                                color: item["color"],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item["value"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}