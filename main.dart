import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AddressUI(),
      /**
       * ShoppingCart() --- 
        RelatedProduct()---
        ProductDetails()---
        Product()----------
        Alter()------------
        AddressUI()--------Current
        MyHomePage()-------
       TODO: ShippingMethod();
       TODO:Older Summary 
       TODO:PaymentDetails()
       */
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.add_shopping_cart),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddressUI(),
                  ),
                );
              },
              child: const Text("Add Address"),
            )
          ],
        ),
      ),
    );
  }
}

class User {}

class Address {
  final String name;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String city;
  String zipCode;
  String state;
  String country;
  String mobile;

  Address(
      {required this.name,
      required this.addressLine1,
      required this.addressLine2,
      required this.addressLine3,
      required this.city,
      required this.zipCode,
      required this.state,
      required this.country,
      required this.mobile});
}

//TODO: GoTo AddressUI Class
class AddressUI extends StatefulWidget {
  //Address add;

  const AddressUI({Key? key}) : super(key: key);

  @override
  _AddressUIState createState() => _AddressUIState();
}

List<Address> myAddress = [
  Address(
    name: "Alexandros",
    addressLine1: "527 Bel Meadow Drive",
    addressLine2: "Line 2",
    addressLine3: "Line 3",
    city: "Pomona",
    zipCode: "91766",
    state: "California",
    country: "United States",
    mobile: "909-287-3615",
  ),
  Address(
    name: "Andreas",
    addressLine1: "1332 Timber Oak Drive",
    addressLine2: "Line 2",
    addressLine3: "Line 3",
    city: "Goleta",
    zipCode: "93117",
    state: "California",
    country: "United States",
    mobile: "805-968-4388",
  ),
  Address(
    name: "Lara Carver",
    addressLine1: "3265 Ashmor Drive",
    addressLine2: "Line 2",
    addressLine3: "Line 3",
    city: "Halma",
    zipCode: "56729",
    state: "Minnesota",
    country: "United States",
    mobile: "218-265-1627",
  )
];

class _AddressUIState extends State<AddressUI> {
  //int? x;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Details"),
        backgroundColor: Colors.black38,
      ),
      body: ListView.builder(itemCount: _listSize(), itemBuilder: itemBuilder),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (myAddress.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 250),
        child: Expanded(
          child: Column(
            children: [
              Text("No address is added",
                  style: Theme.of(context).textTheme.headline4),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Address"),
                onPressed: () => {
                  //print("it's pressed")
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Alter(),
                    ),
                  )
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.all(0.3),
      padding: const EdgeInsets.all(3.0),
      color: Colors.black12,
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    myAddress[index].name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: const Text('Edit'),
                        //TODO:This Edit Button will edit the seelcted address

                        onTap: () {
                          //print("Going to Edit Page");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddressUI(),
                              //TODO:This Navigation is not working as expected
                            ),
                          );
                          //print("Hi from edit Page");
                        },
                      ),
                      PopupMenuItem(
                        child: const Text('Delete'),
                        onTap: () {
                          Address toRemove = myAddress.elementAt(index);
                          myAddress.removeAt(index);

                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                myAddress[index].addressLine1,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                myAddress[index].city,
              ),
              Text(
                myAddress[index].zipCode,
              ),
              Text(
                myAddress[index].state,
              ),
              Text(
                myAddress[index].country,
              ),
              Text(
                myAddress[index].mobile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _listSize() {
    if (myAddress.isEmpty) return 1;
    return myAddress.length;
  }

  static void myFun(Address toAdd) {
    //TODO:This function will be called from other screen to add new Address
    myAddress.add(toAdd);
    //setState(() {});
  }
}

//TODO:GoTo Alter Class used to edit or add new address
class Alter extends StatefulWidget {
  const Alter({Key? key}) : super(key: key);

  @override
  _AlterState createState() => _AlterState();
}

class _AlterState extends State<Alter> {
  static TextEditingController addLine1Controller1 = TextEditingController();
  static TextEditingController addLine1Controller2 = TextEditingController();
  static TextEditingController addLine1Controller3 = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  static TextEditingController zipCodeController = TextEditingController();
  static TextEditingController stateController = TextEditingController();
  static TextEditingController countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Delivery Address",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: addLine1Controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address Line1',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: addLine1Controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address Line2',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: addLine1Controller3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address Line3',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: zipCodeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Zip Code',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: stateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'State',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: countryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Country',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Chip(
                backgroundColor: Colors.blueGrey,
                label: Text(
                  "Home",
                ),
              ),
              Chip(
                backgroundColor: Colors.blueGrey,
                label: Text(
                  "Office",
                ),
              ),
              Chip(
                backgroundColor: Colors.blueGrey,
                label: Text(
                  "Others",
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            width: 340.0,
            height: 50.0,
            child: TextButton(
              onPressed: () {
                setState(() {
                  Address newAdd = Address(
                      name: "Default",
                      addressLine1: addLine1Controller1.text,
                      addressLine2: addLine1Controller2.text,
                      addressLine3: addLine1Controller3.text,
                      city: cityController.text,
                      zipCode: zipCodeController.text,
                      state: stateController.text,
                      country: countryController.text,
                      mobile: "Default");
                  myAddress.add(newAdd);
                });
                //var x = AddressUI();

                Navigator.of(context).pop();
                //TODO:Address will be reflected on AdressUI()
                //TODO:Save Address button is not working as expected
              },
              child: Text(
                "Save Address",
                style: Theme.of(context).textTheme.headline6,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//TODO:GoTo Product Class
class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final String energy = "Energy";
  final String mealSupport = "Meal Support";
  final String menEssentials = "Men's Essentials";
  final String womenEssentials = "Women's Essentials";
  final String generalNeutrition = "General Neutrition";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Icon(
              Icons.search,
            ),
            Icon(Icons.add_shopping_cart)
          ],
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const CupertinoSearchTextField(
                //padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                backgroundColor: Colors.white,
                placeholder: "Search Product",
                itemColor: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.network(
                "https://blackdiamondsupplements.com/wp-content/uploads/2021/04/bcaa-supreme.jpg",
              ),
            ),
            const Text(
              "Shop by catagory",
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),

            //Banner(message: message, location: location)
            Card(
              color: Colors.black26,
              shadowColor: Colors.black26,
              child: Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                padding: const EdgeInsets.all(16.0),
                color: Colors.black26,
                width: 300.0,
                height: 100.0,
                child: Text(
                  generalNeutrition,
                  style: const TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.black12,
                    shadowColor: Colors.black,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.black26,
                      //width: 150.0,
                      height: 100.0,
                      child: Text(
                        menEssentials,
                        style: const TextStyle(
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.black12,
                    shadowColor: Colors.black,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.black26,
                      width: 150.0,
                      height: 100.0,
                      child: Text(
                        womenEssentials,
                        style: const TextStyle(
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.black12,
                    shadowColor: Colors.black,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.black26,
                      padding: const EdgeInsets.all(16.0),
                      //width: 150.0,
                      height: 100.0,
                      child: Text(
                        mealSupport,
                        style: const TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.black12,
                    shadowColor: Colors.black,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.black26,
                      width: 150.0,
                      height: 100.0,
                      child: Text(
                        energy,
                        style: const TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//TODO:GoTo ProductDetails Class
class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Widget createDetailedProduct(String productName, double price,
      String information, String use, String whenToTake, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.network(
            imageUrl,
            width: 350,
            height: 200,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Text(
            productName,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Text(
            "\$ $price",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Text(
            "INFORMATION:-$information",
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Text(
            "USE:- $use",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Text(
            "WHEN TO TAKE:- $whenToTake",
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Name Details",
        ),
      ),
      body: createDetailedProduct(
          "BCAAs",
          24.50,
          "Long Information....",
          "to boost energy and block brain messages signaling fatigue to prolong endurance and serve as muscle fuel to spare muscle proteins during post-exercise recovery",
          "mix 1 scoop with 6-8 oz of water and sip during any workout. May also, be taken before workouts and throughout the day to maintain a positive nitrogen balance.",
          "https://store.bodyfitstation.com/wp-content/uploads/2017/02/Scivation-Xtend-BCAAs-90-Servings-Pink-Lemonade-3.1-800x800.jpg"),
    );
  }
}

//TODO:GoTo RelatedProduct Class
class RelatedProduct extends StatefulWidget {
  const RelatedProduct({Key? key}) : super(key: key);

  @override
  _RelatedProductState createState() => _RelatedProductState();
}

class _RelatedProductState extends State<RelatedProduct> {
  Widget createItem(
      String itemName, double price, int noOfCaps, String imageUrl) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 150,
            height: 150,
            child: Image.network(imageUrl),
          ),
          Column(
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                "$noOfCaps capsules",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "\$ $price",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Energy",
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.only(left: 4),
              child: const Text(
                "All Supplements",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.only(left: 4),
              child: const Text(
                "3 suppliments available",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            createItem("BCAAs", 17.97, 60,
                "https://store.bodyfitstation.com/wp-content/uploads/2017/02/Scivation-Xtend-BCAAs-90-Servings-Pink-Lemonade-3.1-800x800.jpg"),
            createItem("Fat Burner", 24.50, 60,
                "https://bws.gr/image/cache/catalog/p/814-1994-650x650h.jpg"),
            createItem("Natural Energy", 16.36, 60,
                "https://images.wbstatic.net/big/new/9880000/9886394-1.jpg"),
          ],
        ),
      ),
    );
  }
}

//TODO:This is ShoppingCart Class
class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Widget> cartItems = [];
  Widget createCartItem(String itemName, int noOfItem, double pricePerItem,
      double savingPerItem, double weightPerItem, String imageUrl) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 150,
            height: 150,
            child: Image.network(imageUrl),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemName,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "\$$pricePerItem",
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Text(
                "\$${savingPerItem * noOfItem} Savings",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "Total Price\$${pricePerItem * noOfItem}",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.remove_shopping_cart),
                    label: const Text("Remove"),
                    onPressed: () => {
                      //print("it's pressed")
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping Cart",
        ),
      ),
      body: Column(
        children: [
          createCartItem("Fat Burner", 2, 24.50, 2, 1,
              "https://bws.gr/image/cache/catalog/p/814-1994-650x650h.jpg"),
          createCartItem("Fat Burner", 2, 24.50, 2, 1,
              "https://bws.gr/image/cache/catalog/p/814-1994-650x650h.jpg"),
          createCartItem("Fat Burner", 2, 24.50, 2, 1,
              "https://bws.gr/image/cache/catalog/p/814-1994-650x650h.jpg")
        ],
      ),
    );
  }
}
/*


*/
