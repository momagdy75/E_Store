import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:awazon/Screens/Home.dart';
import 'package:awazon/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CartScreen.dart';
class ItemScreen extends StatefulWidget {
  Product product;
  ItemScreen(this.product);

  @override
  State<ItemScreen> createState() => _ItemScreenState();

}

class _ItemScreenState extends State<ItemScreen> {

  int index=0;



  void initState() {
    super.initState();
    ToastContext().init(context);
  }
 static List<Product>CartProducts=[];

 /* _readone() async {
    final prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString('cart');
    print("loded is :$json");
    if(json!=null){
    List<dynamic>list = jsonDecode(json);
      print("list is :$list");
      for(int i=0;i<list.length;i++){
        CartProducts.add(Product.fromJson(list[i]));
      }
    }
  }*/

  _saveone() async{
    final prefs = await SharedPreferences.getInstance();
    final productitem = CartProducts;
    var value = json.encode(productitem);
    print("$value");
    prefs.setString('cart', value);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xff333742) ,
      body:Column(
        children: [
         Container(
           height: 180,
           width: MediaQuery.of(context).size.width,
           color: Color(0xff333742),
           child: SafeArea(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     IconButton(onPressed: (){
                       _saveone();
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                     },
            icon: Icon(Icons.arrow_back_ios), color: Colors.white,),
                     Spacer(),
                     TextButton(onPressed: (){
                       CartProducts.clear();
                     }, child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: 18),)),
                     Visibility(
                         visible: HomeScreen.cartisEmpty ? false : true,
                         child: IconButton(
                           onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) =>
                                     CartScreen(CartProducts)));
                           },
                           icon: Icon(
                             FontAwesomeIcons.cartShopping,
                             size: 18,
                           ),
                           color: Colors.white,
                         ))
                   ],
                 ),
                 Center(child: Text(widget.product.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
               ],
             ),
           ),
         ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff454D5A),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(image:AssetImage(widget.product.image),width: 200,height: 200,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("\$ "+widget.product.price.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.truckFast,color: Colors.grey,),
                        SizedBox(width: 15,),
                        Text("Price include VAT and shipping",style: TextStyle(color: Colors.grey,fontSize: 16),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                    child: Text(widget.product.description,style: TextStyle(color: Colors.white,fontSize: 18,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w300),maxLines: 3),
                  ),
                Spacer(),
                Container(
                  height: 80,
                decoration: BoxDecoration(
                  color: Color(0xff333742),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(26),topLeft: Radius.circular(26))
                ),
                  child: Row(

                    children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff454D5A),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(child: IconButton(icon: Icon(Icons.favorite,color:widget.product.isFavorite?  Colors.red:Colors.white,size: 22,),onPressed: (){
                           setState(() {
                              widget.product.isFavorite=!widget.product.isFavorite;
                           });

                        },)),
                      ),
                    ),
                      GestureDetector(
                        onTap: () async{
                         if(HomeScreen.cartisEmpty==true){
                           setState(() {
                             HomeScreen.cartisEmpty=false;
                           });
                         }
                         CartProducts.insert(index, widget.product);
                         index++;
                         setState(() {

                         });
                         Toast.show(widget.product.title+" added to cart successfully",duration: 2);

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff454D5A),
                                borderRadius: BorderRadius.circular(12)
                            ),
                         child: Row(mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(right:20),
                               child: Icon(FontAwesomeIcons.cartPlus,color: Colors.white,size: 18,),
                             ),
                             Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 18),),
                           ],
                         ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                ],
              ),

            ),
          ),

        ],
      )
    );
  }
}
