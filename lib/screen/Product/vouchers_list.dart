import 'package:flutter/material.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white38, // Set background color to aqua
              shape: BoxShape.rectangle, // Optionally, you can set a circular shape
              borderRadius: BorderRadius.circular(16.0)
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Handle plus icon press
              },
              color: Colors.black, // Set icon color to white
            ),
          ),
        ),
        title: const Text('Voucher Codes'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(10, 201, 189, 1), // Set background color to aqua
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0)// Optionally, you can set a circular shape
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Handle plus icon press
                },
                color: Colors.white, // Set icon color to white
              ),
            ),
          ),

        ],
      ),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Text(
              '2 vouchers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset('assets/voucher/sale2.png'),
            title: const Text('Summer sale 2023',style:TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold
            ),),
            subtitle: const Text('12 May 2023       Discount 50%',style:TextStyle(
                fontSize: 18
            ),),
          ),
          ListTile(
            leading: Image.asset('assets/voucher/sale3.png'),
            title: const Text('Flash sale 2023',style:TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold
            ),),
            subtitle: const Text('8 May 2023       Discount 25%',style:TextStyle(
                fontSize: 18
            ),),
          )
        ],
      ),
    ),
  ),
    );
  }
}
