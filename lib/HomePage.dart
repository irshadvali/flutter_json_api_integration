import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Model/Data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MaterialColor> _color=[Colors.deepOrange,Colors.blueGrey,Colors.green,Colors.red,Colors.purple,Colors.amber,Colors.blue];
  Future<List<Data>> getAllData() async {
    var api = 'https://jsonplaceholder.typicode.com/photos';
    var data = await http.get(api);
    var jsonData = json.decode(data.body);
    List<Data> listOf = [];

    for (var i in jsonData) {
      Data data = new Data(i["id"], i["title"], i["url"], i["thumbnailUrl"]);
      listOf.add(data);
    }

    return listOf;
  }

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
      body: new ListView(
        children: <Widget>[
          // start of first container
          new Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            child: new FutureBuilder(
              future: getAllData(),
              builder: (BuildContext c, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: new Text("Loading Data"),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext c, int index) {
                        MaterialColor mColor=_color[index % _color.length];
                        return Card(
                          elevation: 10.0,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Image.network(
                                snapshot.data[index].url,
                                height: 150.0,
                                width: 150.0,
                                fit: BoxFit.cover,
                              ),
                              new SizedBox(
                                height: 7.0,
                              ),
                              new Container(
                                margin: EdgeInsets.all(6.0),
                                height: 50.0,
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      child: new CircleAvatar(
                                        child: new Text(
                                            snapshot.data[index].id.toString()),
                                        backgroundColor: mColor,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                    new SizedBox(
                                      width: 7.0,
                                    ),
                                    new Container(
                                      width:80.0,

                                      child: new Text(snapshot.data[index].title
                                          .toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.deepOrange
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          ), // end of first container

          new SizedBox(height: 7.0),
          // Second Container Start
          new Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: new FutureBuilder(
                future: getAllData(),
                builder: (BuildContext c, AsyncSnapshot snapshot){
                  if (snapshot.data == null) {
                    return Center(
                      child: new Text("Loading Data"),
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext c, int index){
                          MaterialColor mColor=_color[index % _color.length];
                          return Card(
                            elevation: 7.0,
                            child: new Container(
                              height: 80.0,
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  new Expanded(

                                      flex: 1,
                                      child: new Image.network(snapshot.data[index].thumbnailUrl,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      )
                                  ),

                                  new SizedBox(width: 7.0),
                                  new Expanded(
                                      flex: 2,
                                      child: new Text(snapshot.data[index].title,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),)
                                  ),


                                  new Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                        child: new Text(
                                          snapshot.data[index].id.toString(),
                                        ),
                                        backgroundColor:mColor ,
                                        foregroundColor: Colors.white,
                                      )),

                                ],
                              ),
                            ),
                          );
                        });
                  }



            }

            ),

          ),// Second Container end
        ],
      ),
    );
  }
}
