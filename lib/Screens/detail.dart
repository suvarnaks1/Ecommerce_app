import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                            onPressed: () {
                                                          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DetailPage()),
  );
                            }, icon: Icon(Icons.arrow_back)),
                     IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border)),
                    
                  ],
                ),
                   ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                            bottomRight: Radius.circular(16)),
                                        child: Image.asset('assets/photo.jpeg',height: 240,width: double.infinity,fit: BoxFit.contain,)
                                      ),
                //Image.asset('assets/photo.jpeg',height: 240,width: double.infinity,fit: BoxFit.fill,) 
              ],
            ),
          )
        ],
      ),
    );
  }
}
