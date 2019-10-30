import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }
  void doSub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }// TODO : pada kelas home state yang terdapat pada homepage sehingga pada variabe; num1 dan num2 bernilai 0
// TODO pada perintah void ini digunakan untuk perintah untuk penjumlahan dan pengurangan
  void doMul() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }
// TODO pada perintah yang terdapat pada diatas yaitu digunakan untuk operasi perkalian dan pembagian
  void doClear() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),

      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            new Text(
              "Output : $sum",
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 1"),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 2"),
              controller: t2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.greenAccent,
                  onPressed: doAddition,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.greenAccent,
                  onPressed: doSub,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
              //
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("*"),
                  color: Colors.greenAccent,
                  onPressed: doMul,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  color: Colors.greenAccent,
                  onPressed: doDiv,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.greenAccent,
                  onPressed: doClear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}// TODO : pada perintah ini digunakan pada perintah yang terdapat pada perintah kalkulator sehingga terdapat beberapa perintah yang ada didalamnya
class tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.android)),
                Tab(icon: Icon(Icons.assessment)),
                Tab(icon: Icon(Icons.build)),
              ],
            ),
            title: Text('Rute'),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              SnackBarPage(),
              list(),

            ],
          ),
          drawer: drawer(),
        ),
      ),
    );
  }// TODO : pada kelas tab ini terdapat pemanggilan kelas pada kelas homepage, snackbar dan list
  @override
  Widget drawer() {
    return Scaffold(
      body: tab(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:  Image.asset('image/2.png', width: 50, height: 50),
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
              ),
            ),
            ListTile(
              title: Text('Kalkulator'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

              },
            ),
            ListTile(
              title: Text('Kalender'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}// TODO : pada perintah ini yang terdapat pada menu drawer dimana pada perintah ini untuk menampilkan list yang didapat dari menu drawer
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('anda yakin'),
            action: SnackBarAction(
              label: 'wis',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
// TODO : pada perintah ini terdapat fungsi untuk snackbar yang digunakan untuk menampilkan tombol button show snackbar
class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.computer),
              title: Text('computer'),
            ),
            ListTile(
              leading: Icon(Icons.clear_all),
              title: Text('clear'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}// TODO : pada perintah ini digunakan untuk menampilkan icon yang ditambahkan oleh user yang terdapat pada tab bar dan didalamnya ada list view

