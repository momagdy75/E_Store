import 'package:awazon/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
class CartScreen extends StatefulWidget {
  List<Product> newproducts;

  CartScreen(this.newproducts);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total=0;
  double getTotal(double total){
    for(int i=0;i<widget.newproducts.length;i++){
      total=total+widget.newproducts[i].price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor:Color(0xff333742) ,
        appBar: AppBar(
          backgroundColor: Color(0xff333742),
          title: Text("Cart"),
          centerTitle: true,


          elevation: 0,
        ),
        body: Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CartItem(title: widget.newproducts[index].title, price:widget.newproducts[index].price , image: widget.newproducts[index].image),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: widget.newproducts.length),
          ),
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: Color(0xff454D5A),
              borderRadius: BorderRadius.only(topRight: Radius.circular(26),topLeft: Radius.circular(26))
          ),
          child: Row(

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Total: \$ "+getTotal(total).round().toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: (){
                    Toast.show("Your purchase has been successfully completed",duration: 3);
                  },
                  child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff585866),
                          borderRadius: BorderRadius.circular(12)
                      ),
                    child: Center(
                      child: Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]
        )
    );
  }

  Widget CartItem(
      {required String title, required double price, required String image}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color(0xff585866),borderRadius: BorderRadius.circular(12)),

      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("$image"),
            width: 100,
            height: 100,
          ),
          Center(
              child: Text(
            "$title",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "\$ $price",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

}
