import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text App"),
        ),
        body: TextSample(),
      ),
    );
  }
}
class TextSample extends StatefulWidget {
  @override
  _TextSample createState() => _TextSample();
}
class _TextSample extends State<TextSample> {
  TextEditingController contentControl1 = TextEditingController();
  TextEditingController contentControl2 = TextEditingController();
  TextEditingController contentControl3 = TextEditingController();
  List<String> names = [""];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15),
              child: TextField(
                controller: contentControl1,
                decoration: InputDecoration(
                  labelText: "Enter Your Name:",
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5),),),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: TextField(
                controller: contentControl2,
                decoration: InputDecoration(
                  labelText: "Enter Your SurName:",
                  hintText: "SurName",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5),),),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: TextField(
                controller: contentControl3,
                decoration: InputDecoration(
                  labelText: "Value from Name TextWidget:",
                  hintText: "Coming from Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5),),),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5),
              child: Container(
                color: Colors.lightBlueAccent.shade100,
                width: double.infinity, //tamamına yayma
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4, //ekran boyutunun 4'te birini container'a atama
                child: Center(
                  child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          "${index + 1}- " + names[index],
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        );
                      }
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      names.add(contentControl1.text.toString() + " " +
                          contentControl2.text.toString());
                      contentControl3 = TextEditingController(
                          text: contentControl1.text.toString() + " " +
                              contentControl2.text.toString());
                    });
                  },
                  child: Text("Post"),),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contentControl1.clear();
                      contentControl2.clear();
                      contentControl3.clear();
                      names.clear();
                    });
                  },
                  child: Text("Delete"),),

              ],

            )

          ]

      ),

    );

  }

}


