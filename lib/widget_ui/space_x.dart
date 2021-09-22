import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space/model/dragon.dart';
import 'package:space/model/launche.dart';
import 'package:space/model/shapis.dart';

class Spacex extends StatefulWidget {
  const Spacex({Key? key}) : super(key: key);

  @override
  _SpacexState createState() => _SpacexState();
}

class _SpacexState extends State<Spacex> with SingleTickerProviderStateMixin {
  late TabController myController;
  ModelDragons modelDragons = ModelDragons();
  Launches launches = Launches();
  Shapis shapis = Shapis() ;

  @override
  void initState() {
    myController = new TabController(length: 3, vsync: this);
    super.initState();

    modelDragons;
   shapis;
    launches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("SpaceX"),
        centerTitle: true,
        //leading: Icon(Icons.assignment),
        bottom: TabBar(
            controller: myController,
            onTap: (item) {
              print(item);
            },
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                child: Text("Dragons"),
              ),
              Tab(
                child: Text("Lunches"),
              ),

              Tab(
                child: Text("Ships"),
              ),


            ]),
      ),
      drawer: Drawer(
        child:Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          height: double.infinity,
          width: 300,
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 5, 20, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 10, 20),
                  child: Container(
                    height: 100,
                    width: 120,
                    color: Colors.orange[200],
                    child: ListTile(
                      isThreeLine: true,
                      title: Text("Youssef Tarek",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      subtitle: Text("San Francesco"),
                      leading: Image.asset("images/1.JPG"),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      "images/1.JPG",
                      width: 200,
                      height: 350,
                      fit: BoxFit.fill,
                    )),
                /*    Padding(
                  padding: const EdgeInsets.all(5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("");
                    },
                    color: Colors.orange[200],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 100, 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3, top: 5, right: 15, bottom: 5),
                            child: Icon(Icons.home),
                          ),
                          Text("Home",
                              style: TextStyle(color: Colors.black, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("launch");
                    },
                    color: Colors.orange[200],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 100, 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3, top: 5, right: 15, bottom: 5),
                            child: Icon(Icons.home),
                          ),
                          Text("Explore",
                              style: TextStyle(color: Colors.black, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ),



             */

              ],
            ),
          ),
        ),
      ),
      body: Container(
        child:
              TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: myController,
                  children: [
                     FutureBuilder<List<ModelDragons>?>(
                            future: modelDragons.fetchDagons() ,
                            builder: (context, snap) {
                              if (snap.connectionState != ConnectionState.done) {
                                return Container(
                                  height: double.infinity,
                                  width: 400,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                );
                              } else if (snap.hasData) {
                                List<ModelDragons>? listModel = snap.data;
                                return Container(
                                  child: ListView.builder(
                                    itemCount: listModel!.length,
                                    itemBuilder: (context, index) {
                                      return
                                           Container(
                                              child: Card(
                                                color: Colors.orange[100],
                                                elevation: 15,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(color: Colors.black),
                                                    borderRadius: BorderRadius.circular(30)),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                          listModel[index].name.toString()),
                                                      subtitle: Text(
                                                          "type : ${listModel[index].type}"),
                                                      leading: CircleAvatar(
                                                        backgroundImage: NetworkImage(
                                                            listModel[index]
                                                                .flickrImages!
                                                                .last),
                                                        radius: 50,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                        const EdgeInsets.only(left: 0),
                                                        child: OutlineButton(
                                                          onPressed: () => print("active"),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(30),
                                                          ),
                                                          color: Colors.grey,
                                                          borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.blueAccent,
                                                          ),
                                                          textColor: Colors.black,
                                                          child: Text(
                                                            listModel[index]
                                                                .active
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors.black),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),


                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text("No Data Found"),
                                );
                              }
                            }),



                    FutureBuilder<List<Launches>?>(
                            future: launches.fetchLaunches(),
                            builder: (context, snap) {
                              if (snap.connectionState != ConnectionState.done) {
                                return Container(
                                  color: Colors.grey,
                                  height: double.infinity,
                                  width: 400,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                );
                              } else if (snap.hasData) {
                                List<Launches>? listModel = snap.data;

                                return ListView.builder(
                                  itemCount: listModel!.length,
                                  itemBuilder: (context, index) {
                                    return  Container(
                                        child: Card(
                                          color: Colors.orange[100],
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.circular(30)),
                                          child: Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  5, 20, 5, 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ListTile(
                                                    title: Text(listModel[index]
                                                        .name
                                                        .toString(),),
                                                    subtitle: Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 20),
                                                      child: Text(listModel[index]
                                                          .details
                                                          .toString()),
                                                    ),
                                                    leading:  CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          listModel[index].links.toString()),
                                                      radius: 50,
                                                    ),
                                                  ),
                                                  //"https://i.imgur.com/9fWdwNv.jpg"

                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          "${listModel[index].dateUtc.toString()}"))
                                                ],
                                              ),
                                            ),
                                          ),


                                    );
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text("No Data Found"),
                                );
                              }
                            }),


                    FutureBuilder<List<Shapis>?>(
                            future: shapis.fetchShapis(),
                            builder: (context, snap) {
                              if (snap.connectionState != ConnectionState.done) {
                                return Container(
                                  height: double.infinity,
                                  width: 400,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                );
                              } else if (snap.hasData) {
                                List<Shapis>? listModel = snap.data;

                                return ListView.builder(
                                  itemCount: listModel!.length,
                                  itemBuilder: (context, index) {
                                    return  Container(
                                        child: Card(
                                          color: Colors.orange[100],
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.circular(30)),
                                          child:  Column(
                                              children: [
                                                ListTile(
                                                    title: Text(
                                                        listModel[index].name.toString()),
                                                    subtitle: Text(
                                                        "type : ${listModel[index].type}"),
                                                    leading: CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          listModel[index]
                                                              .image
                                                              .toString()),
                                                      radius: 50,
                                                    )),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets.only(left: 0),
                                                    child: OutlineButton(
                                                      onPressed: () => print("active"),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(30),
                                                      ),
                                                      color: Colors.grey,
                                                      borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.blueAccent,
                                                      ),
                                                      textColor: Colors.black,
                                                      child: Text(
                                                        listModel[index]
                                                            .active
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text("No Data Found"),
                                );
                              }
                            }),






                  ]),

      ),
    );
  }
}

