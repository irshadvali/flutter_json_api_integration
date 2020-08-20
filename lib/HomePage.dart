import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Api Integration"),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint("Search")),
          new IconButton(
              icon: new Icon(Icons.add), onPressed: () => debugPrint("add"))
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Irshad Vali"),
              accountEmail: new Text("abc@gmail.com"),
              decoration: new BoxDecoration(color: Colors.deepOrange),
            ),
            new ListTile(
              title: new Text("First Page"),
              leading: new Icon(Icons.search, color: Colors.orange),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            
            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.add, color: Colors.red),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Third Page"),
              leading: new Icon(Icons.title, color: Colors.purple),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Four Page"),
              leading: new Icon(Icons.list, color: Colors.green),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            new Divider(
              height: 5.0,
            ),
            new ListTile(
              title: new Text("Close"),
              leading: new Icon(Icons.close, color: Colors.red),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        ),
      ),
    );
  }
}
