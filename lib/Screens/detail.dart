import 'package:ecomerce_app/Screens/HomePage.dart';
import 'package:ecomerce_app/models/ecomercemodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final EcommerceModel product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.lightBlue,
                    size: 30,
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: const Color.fromARGB(255, 250, 38, 38),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_checkout,
                  size: 30,
                  color: const Color.fromARGB(255, 255, 162, 24),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              // color: Colors.amber,
              height: 400,
              width: double.infinity,
              child: Image.network(
                product.image,
                // height: 240,
                // width: double.infinity,
                // fit: BoxFit.cover,
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                  child: Text(
                product.title,
                style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              )),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.share))
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 210),
            child: Text("special offer ",style: GoogleFonts.abhayaLibre(fontSize: 30,color: Colors.green),),
          )
        ],
      ),
    );
  }
}
