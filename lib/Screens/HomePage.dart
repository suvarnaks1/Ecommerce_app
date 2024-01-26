import 'package:ecomerce_app/Screens/detail.dart';
import 'package:ecomerce_app/controller/fetch.dart';
import 'package:ecomerce_app/models/ecomercemodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<EcommerceModel>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> containerColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                      ),
                      Text(
                        "Gleaming Gallery",
                        style: GoogleFonts.blackOpsOne(
                            color: Colors.blueAccent, fontSize: 20),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                        child:
                            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text(
                  "Hello",
                  style: GoogleFonts.sacramento(color: Colors.red, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text(
                  "Keep shoping",
                  style: GoogleFonts.lemon(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 30,
              ),
      
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 5.5,
                          decoration: BoxDecoration(
                              color: containerColors[i],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '30% off on Winder Collection',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Container(
                                    width: 90,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Center(
                                        child: Text(
                                      'Shop Now',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                  )
                                ],
                              )),
                              //image
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
      
              Text("New Arrivals",style: GoogleFonts.rubikMaze(fontSize: 30,color: const Color.fromARGB(255, 4, 66, 117)),),
              //grid view add
              SizedBox(
                child: FutureBuilder<List<EcommerceModel>>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    print("ffffffffffff");
                    if (snapshot.hasData) {
                      print('dddddddddddddddddd');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    mainAxisExtent: 300,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: snapshot.data!.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DetailPage()),
  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  // child:    Image.network(
                                  //                       snapshot.data![index].image,
                                  //                       fit: BoxFit.fill,
                                  //                     ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16)),
                                        child: Image.network(
                                          snapshot.data![index].image,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: double.infinity,
                                                height: 30,
                                                child: Text(
                                                  snapshot.data![index].category,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.money_off,
                                                      color: const Color.fromARGB(255, 247, 222, 2),
                                                    )),
                                                Container(
                                                  width: 100,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.black12),
                                                  child: Center(
                                                      child: Text(
                                                    snapshot.data![index].price.toString(),
                                                    style: TextStyle(
                                                        color: const Color.fromARGB(255, 2, 84, 5),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
