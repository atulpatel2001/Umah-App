import 'package:flutter/material.dart';

class ProductScan extends StatefulWidget {
  const ProductScan({super.key});

  @override
  State<ProductScan> createState() => _ProductScanState();
}

class _ProductScanState extends State<ProductScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
              color: Colors.black.withOpacity(0.4), // Slightly different background color
            ),
            child: IconButton(
              icon: const Icon(Icons.flash_on),
              onPressed: () {
                // Handle close button press
              },
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
                color: Colors.black.withOpacity(0.4), // Slightly different background color
              ),
              child: IconButton(
                icon: const Icon(Icons.close_sharp),
                onPressed: () {
                  // Handle close button press
                },
                color: Colors.white,
              ),
            ),
          ],
          title: const Text('Scan Products',style: TextStyle(color: Colors.white,fontSize: 14),),
          centerTitle: true,
        ),
      body: const Scaffold(
        backgroundColor: Colors.black,
      ),
    );
  }
}
