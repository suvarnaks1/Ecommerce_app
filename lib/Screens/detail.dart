import 'package:ecomerce_app/Screens/HomePage.dart';
import 'package:ecomerce_app/models/ecomercemodel.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final EcommerceModel product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 25.0,
                )
              ],
            ),
            height: 300,
            width: double.infinity,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    child: Image.asset(
                      product.image,
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                //Image.asset('assets/photo.jpeg',height: 240,width: double.infinity,fit: BoxFit.fill,)
                Text(product.category)
              ],
            ),
          )
        ],
      ),
    );
  }
}
