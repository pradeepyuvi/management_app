import 'package:flutter/material.dart';
import 'pg_home_bottom_bar.dart';

/// ------------------ MODEL ------------------
class Customer {
  final String name;
  final String phone;
  final String room;
  final String sharing;
  final String imageUrl;
  bool isPaid;

  Customer({
    required this.name,
    required this.phone,
    required this.room,
    required this.sharing,
    required this.imageUrl,
    required this.isPaid,
  });
}

/// ------------------ PAGE ------------------
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<Customer> customers = [
    Customer(
      name: 'Pradeep',
      phone: '9845896545',
      room: '102',
      sharing: 'two',
      imageUrl:
          'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg',
      isPaid: true,
    ),
    Customer(
      name: 'Ranjith',
      phone: '9876543210',
      room: '201',
      sharing: 'three',
      imageUrl:
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
      isPaid: false,
    ),
  ];

  int _selectedTab = 1; // 0 = PG List, 1 = Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text('Customer Details'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      // ---------------- BODY ----------------
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search customer...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Filter / room row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffEDE2FF),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0xffCFC1E8),
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Color(0xffCFC1E8),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "pending",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.check, size: 18, color: Colors.black),
                              SizedBox(width: 6),
                              Text(
                                "paid",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Select Room",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.keyboard_arrow_down, size: 22),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Customer list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return CustomerCard(
                  customer: customers[index],
                  onStatusChanged: () {
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ],
      ),

      // ---------------- BOTTOM BAR ----------------
      bottomNavigationBar: PgHomeBottomNavBar(
        selectedIndex: _selectedTab,
        onTabChanged: (index) {
          setState(() => _selectedTab = index);
          // TODO: add navigation when you have PG list / Home pages
        },
      ),
    );
  }
}

/// ------------------ CUSTOMER CARD ------------------
class CustomerCard extends StatefulWidget {
  final Customer customer;
  final VoidCallback onStatusChanged;

  const CustomerCard({
    super.key,
    required this.customer,
    required this.onStatusChanged,
  });

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    final c = widget.customer;

    final Color statusColor = c.isPaid
        ? Colors.amber.shade700
        : Colors.red.shade700;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Column(
          children: [
            // top
            Container(
              color: const Color(0xfff9f0ff),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(c.imageUrl),
                    backgroundColor: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Phone',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Room',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Sharing',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(c.phone, style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 6),
                            Text(c.room, style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 6),
                            Text(
                              c.sharing,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // bottom buttons
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: statusColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                      ),
                      onPressed: () {
                        setState(() {
                          c.isPaid = !c.isPaid;
                          widget.onStatusChanged();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            c.isPaid
                                ? Icons.check_circle_outline
                                : Icons.schedule_outlined,
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(c.isPaid ? 'Paid' : 'UnPaid'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Calling ${c.phone} (dummy)')),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, size: 20),
                          SizedBox(width: 6),
                          Text('Call'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
