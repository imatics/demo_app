import 'package:demo_app/my_shipment_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyShipment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyShipmentState>(
      builder: (context, shipmentState, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            "My Shipments",
            style: TextStyle(color: Colors.grey[800]),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
                onPressed: () {}),
          ],
        ),
        body:_buildMainBody(shipmentState.selectedPageIndex),



        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomBarItem(Icons.local_shipping_sharp, "My Shipments", () {
                  shipmentState.selectedPageIndex = 0;
                }, shipmentState.selectedPageIndex == 0),
                _bottomBarItem(Icons.search, "Find Loads", () {
                  shipmentState.selectedPageIndex = 1;
                }, shipmentState.selectedPageIndex == 1),
                _bottomBarItem(Icons.payments_outlined, "Payment", () {
                  shipmentState.selectedPageIndex = 2;
                }, shipmentState.selectedPageIndex == 2),
                _bottomBarItem(Icons.person_pin, "Account", () {
                  shipmentState.selectedPageIndex = 3;
                }, shipmentState.selectedPageIndex == 3),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildMainBody(int index){
    switch(index){
      case 0: return  CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(
                  _buildListSegment(5, "Ongoing shipments", true))),
          SliverList(
              delegate: SliverChildListDelegate(
                  _buildListSegment(5, "Upcoming shipments", false))),
        ],
      );
      case 1: return  Center(
        child: Text("Find Shipment",),
      );
      case 2: return  Center(
        child: Text("Payment",),
      );
      case 3: return  Center(
        child: Text("Account",),
      );
    }
    return Container();
  }



  Widget _bottomBarItem(
      IconData icon, String title, VoidCallback onPress, bool selected) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                icon,
                color: selected ? Colors.blue[700] : null,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.blue[700] : null,
              ),
            ),
            Spacer(),
            Container(
              height: 4,
              color: selected ? Colors.blue[700] : null,
            )
          ],
        ),
      ),
    );
  }


  List _buildListSegment(int count, String title, bool isOutgoing) {
    List<Widget> listItems = [];
    listItems.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.w600),
      ),
    ));
    for (int i = 0; i < count; i++) {
      listItems.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: _buildItemCard(isOutgoing)));
    }

    return listItems;
  }


  // Hardcoded the details since because there weren't different.
  Widget _buildItemCard(bool isOutgoing) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 5,
                      color: (isOutgoing) ? Colors.purple : Colors.blue[700]))),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 20,
                      child: Image.asset(
                        "assets/images/arrow.png",
                        color: Colors.grey[500],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      padding: const EdgeInsets.only(bottom: 10),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 00),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ottawa, Canada",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[700],
                                      fontSize: 16),
                                ),
                                Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: isOutgoing
                                          ? Colors.purple[100].withAlpha(150)
                                          : Colors.blue[100].withAlpha(150),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Text(
                                    isOutgoing ? "Ongoing" : "New",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: (isOutgoing)
                                            ? Colors.purple
                                            : Colors.blue[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "May 25, 8am to 12pm",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ottawa, Canada",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[700],
                                      fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                    "\$500",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[900],
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "May 25, 8am to 12pm",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLabelValue("Distance", "2500 MIL", null),
                    Container(
                      width: 1,
                      height: 35,
                      color: Colors.grey[400],
                    ),
                    _buildLabelValue("Capacity", "29322", null),
                    Container(
                      width: 1,
                      height: 35,
                      color: Colors.grey[400],
                    ),
                    _buildLabelValue(
                        "Fast Pay",
                        "",
                        Icon(
                          Icons.payments_outlined,
                          size: 18,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelValue(String label, String value, Widget icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey[500], fontSize: 11),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: icon ??
              Text(
                value,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700]),
              ),
        ),
      ],
    );
  }

}

