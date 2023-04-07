import 'package:flutter/material.dart';

class ContohScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: List.generate(10,(index)=>
            Container(
            width: 500,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      20,
                      (index) => Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                              ),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: List.generate(10,
                                (index) => Container(
                                  child: Text("data",style: TextStyle(fontSize: 8),),
                                  alignment: Alignment.center,
                                  height: 35,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                  ),
                                )
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 150,
                              
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        
                      ),
                    ),
                  ),     
            ),
          ),
        ),
      ),
    );
  }
}
