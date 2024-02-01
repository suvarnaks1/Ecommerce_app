import 'package:ecomerce_app/Screens/detail.dart';
import 'package:ecomerce_app/controller/fetch.dart';
import 'package:ecomerce_app/models/ecomercemodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //modelclass
  late Future<List<EcommerceModel>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  // Search controller
  TextEditingController _searchController = TextEditingController();

//category list
  List<String> categories = [
    'Electronics',
    'Cloth',
    'Shoes',
    'Books',
    'Accessories',
    'Toys',
    'Home',
    'Beauty',
    'Sports'
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // App bar
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/photo.jpeg'),
                ),
                SizedBox(width: 10),
                Text(
                  "hello suvarna",
                  style: GoogleFonts.lemon(fontSize: 20),
                ),
                SizedBox(width: 49),
                Padding(
                  padding: EdgeInsets.only(left: deviceWidth * 0.1),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_active_outlined),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Search bar and shopping cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black12,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            // Handle search logic here
                            String searchText = _searchController.text;
                            // Perform search with the searchText
                            print('Searching for: $searchText');
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  child: Image.asset(
                    'assets/shoes.jpeg',
                    height: 100,
                    width: 500,
                    fit: BoxFit.cover,
                  )),
            ),

            // Horizontal ListView.builder
            Container(
              //color: Colors.amber,
              height: 77,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length, // Adjust the number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                      child: Center(
                        child: Text(
                          //different texts
                          categories[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 27),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 19,
            ),
            //gridviewbuilder create

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
                                  mainAxisExtent: 370,
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
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          product: snapshot.data![index])),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                  boxShadow: [  BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes position of shadow
      ),]
                                ),
                                // child:    Image.network(
                                //                       snapshot.data![index].image,
                                //                       fit: BoxFit.fill,
                                //                     ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ClipRRect(
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
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
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
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: const Color.fromARGB(
                                                        255, 247, 222, 2),
                                                        size: 40,
                                                  )),
                                              Text(
                                                ' ${snapshot.data![index].rating.rate}',style: TextStyle(fontSize: 25),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.attach_money,color: Colors.black,size: 30,),
                                              Text(snapshot.data![index].price
                                                  .toString(),style: TextStyle(fontSize:30 ,fontWeight: FontWeight.w900),),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 100),
                                            child: Container(
                                            
                                              width: 60,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(90),
                                                  color: const Color.fromARGB(255, 210, 158, 3)),
                                              child: Center(
                                                 child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.white,)),
                                                 ),
                                            ),
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
    );
  }
}
