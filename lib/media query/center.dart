import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpro/media%20query/resposnive.dart';
import 'package:flutterpro/media%20query/right.dart';

class Centers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 200,
                  crossAxisSpacing: 200),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  color: Colors.blueGrey,
                );
              },
              itemCount: 15,
            ),
            if (Resposnive.isMobile(context)) Right(),
            if (Resposnive.isTab(context)) Right()
          ],
        ),
      ),
    );
  }
}
