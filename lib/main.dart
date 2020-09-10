import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'constructor.dart';


final List<Bikes> _bikes = <Bikes>[
  Bikes(bikeNumber: '1', bikeName: 'Honda', bikeprice: '2000 won'),
  Bikes(bikeNumber: '2', bikeName: 'KTM', bikeprice: '5000 won'),
  Bikes(bikeNumber: '3', bikeName: 'TVS', bikeprice: '7000 won'),
];


void main() =>
    runApp(MaterialApp(
      home: SlideDemo(),
      debugShowCheckedModeBanner: false,
    ));

class SlideDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable '),
      ),
      body: ListView.builder(
        itemCount: _bikes.length,
        itemBuilder: (context, index) {
          final bikes = _bikes[index];
          return Slidable(child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                child: Text(bikes.bikeNumber),
              ),
              title: Text(bikes.bikeName),
              subtitle: Text(bikes.bikeprice),
            ),
          ), actionPane: SlidableBehindActionPane(),
          actions: <Widget>[
            IconSlideAction(
              caption: 'share',
              color: Colors.blue,
              icon: Icons.share,
              onTap: () => print('share'),
            ),
          ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'more',
                color: Colors.yellow,
                icon: Icons.more_horiz,
                onTap: ()=>print('more'),
              ),
              IconSlideAction(
                caption: 'delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: ()=>print('delete'),
              ),

            ],
          );
        },),
    );
  }
}
