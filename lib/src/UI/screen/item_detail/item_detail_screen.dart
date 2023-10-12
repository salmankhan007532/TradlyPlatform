import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradly_platform/src/core/components/fontmanager.dart';

class ItemDetailScreen extends StatefulWidget {
  var itemDetailObj;
   ItemDetailScreen({super.key, required this.itemDetailObj});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: manropeText(text: "Item Detail"),
      ),
      body: Column(
        children: [
          Container(
            height: 300.sp,
            width: 430.sp,
            color: const Color.fromARGB(255, 196, 245, 237),
            child: Image.network(widget.itemDetailObj.image,),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 196, 245, 237),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            manropeText(text: "Title :",fontSize: 18,fontWeight: FontWeight.w700),
                            manropeText(text: "${widget.itemDetailObj.title}",fontSize: 15,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.sp,),
                    Card(
                      color: const Color.fromARGB(255, 196, 245, 237),
                      child: ListTile(
                        title: Row(
                          children: [
                            manropeText(text: "Category :",fontSize: 18,fontWeight: FontWeight.w700),
                            manropeText(text: " ${widget.itemDetailObj.category}",fontSize: 15),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.sp,),
                    Card(
                      color: const Color.fromARGB(255, 196, 245, 237),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            manropeText(text: "Description :",fontSize: 18,fontWeight: FontWeight.w700),
                            manropeText(text: "\n ${widget.itemDetailObj.description}",fontSize: 15),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.sp,),
                    Card(
                      color: const Color.fromARGB(255, 196, 245, 237),
                      child: ListTile(
                        title: Row(
                          children: [
                            manropeText(text: "Price :",fontSize: 18,fontWeight: FontWeight.w700),
                            manropeText(text: " ${widget.itemDetailObj.price}",fontSize: 15),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.sp,),
                  ],
                ),
              ),
            )
          
          ),
        ],
      ),
    );
  }
}