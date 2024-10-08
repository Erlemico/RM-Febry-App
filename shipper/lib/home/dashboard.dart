import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shipping/shipping.dart';
import '../shipping/shippingdetails.dart';
import '../account/account.dart';

class Dashboard extends StatefulWidget {
  final int initialIndex;
  const Dashboard({super.key, this.initialIndex = 0});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Beranda(),
    Pengiriman(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Pengiriman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFE00E0F),
        unselectedItemColor: const Color(0xFF838E9E),
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(color: Color(0xFFE00E0F)),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Beranda',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: 372,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFE11A1A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.local_shipping, size: 80, color: Color(0xFFFFFFFF)),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '50',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                    ),
                    Text(
                      'Pengiriman',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: const Text(
              'Pengiriman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(height: 5),
          
          const ShippingItem(
            orderId: '#1201241215',
            time: '14:00',
            date: 'Selasa, 3 Juli 2024',
            status: 'Pesanan Baru',
            quantity: 2,
            price: 24000,
          ),
        ],
      ),
    );
  }
}

class ShippingItem extends StatelessWidget {
  final String orderId;
  final String time;
  final String date;
  final String status;
  final int quantity;
  final double price;

  const ShippingItem({super.key, 
    required this.orderId,
    required this.time,
    required this.date,
    required this.status,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the top
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/menu/sidedish/rendangdaging.png',
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded( // Expanded to occupy the remaining space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Order ID: $orderId',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          time,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(date),
                        Row(
                          children: [
                            Icon(
                              status == 'Pesanan Baru'
                                  ? Icons.fiber_new
                                  : status == 'Pesanan Selesai'
                                      ? Icons.check_circle
                                      : Icons.cancel,
                              color: status == 'Pesanan Baru'
                                  ? Colors.blue
                                  : status == 'Pesanan Selesai'
                                      ? Colors.green
                                      : const Color(0xFFE00E0F),
                            ),

                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 14,
                                color: status == 'Pesanan Baru'
                                    ? Colors.blue
                                    : status == 'Pesanan Selesai'
                                        ? Colors.green
                                        : const Color(0xFFE00E0F),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Qty: $quantity',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          formatCurrency.format(price),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPengiriman(
                      orderId: orderId,
                      time: time,
                      date: date,
                      status: status,
                      quantity: quantity,
                      price: price,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE00E0F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Detail',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}