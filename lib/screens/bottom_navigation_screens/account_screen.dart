import 'package:flutter/material.dart';

class AcoountScreen extends StatefulWidget {
  const AcoountScreen({ Key? key }) : super(key: key);

  @override
  State<AcoountScreen> createState() => _AcoountScreenState();
}

class _AcoountScreenState extends State<AcoountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/img/person.png",
                  height: 100,
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Afsar Hossen", 
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.edit_outlined, color: Color(0xFF53B175),))
                      ],
                    ),
                    const Text(
                    "lmshuvo97@gmail.com",
                        style: TextStyle(
                        color: Colors.black38
                        ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: const [
                ListTile(
              leading: Icon(Icons.shopping_bag_sharp),
              title: Text("Orders"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("My details"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Delivery Address"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.add_card_outlined),
              title: Text("Payment Method"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.discount_sharp),
              title: Text("Promo Code"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notidications"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.attribution_sharp),
              title: Text("About"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
              ],
            ),
             SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){ }, 
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      primary: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.logout, color: Color(0xFF53B175),),
                        Text("Log out", style: TextStyle(color: Color(0xFF53B175)),),
                        Text(" ")
                      ],
                      )
                    ),
                )
          ]
        ),
      ),
    );
  }
}