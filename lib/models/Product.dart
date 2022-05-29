import 'package:flutter/material.dart';

class Product {
  late final String id;
  late final String title;
  late final String description;
   late final double price;
   late final String image;
  late bool isFavorite;


  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.isFavorite,
  });
  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    isFavorite = json['isFavorite'];
  }

Map<String,dynamic>toJson(){
  return{
    'id':id,
    'title':title,
    'description':description,
    'price':price,
    'image':image,
    'isFavorite':isFavorite,
  };
}
}

List<Product> products = [
  Product(
    id: 'p1',
    title: 'Red Shirt',
    description: 'A red shirt - it is pretty red!',
    price: 29.99,
    image: 'assets/images/product1.png',
    isFavorite: false,
  ),
  Product(
    id: 'p2',
    title: 'Trousers',
    description: 'A nice pair of trousers.',
    price: 59.99,
    image: 'assets/images/product2.png',
    isFavorite: false,
  ),
  Product(
    id: 'p3',
    title: 'Yellow Scarf',
    description: 'Warm and cozy - exactly what you need for the winter.',
    price: 19.99,
    image: 'assets/images/product3.png',
    isFavorite: false,
  ),
  Product(
      id: 'p4',
      title: "Keyboard",
      description: "RGB Keyboard",
      price: 29.99,
      image: 'assets/images/product4.png',
      isFavorite: false),
  Product(
    id: 'p1',
    title: 'Red Shirt',
    description: 'A red shirt - it is pretty red!',
    price: 29.99,
    image: 'assets/images/product1.png',
    isFavorite: false,
  ),
  Product(
    id: 'p2',
    title: 'Trousers',
    description: 'A nice pair of trousers.',
    price: 59.99,
    image: 'assets/images/product2.png',
    isFavorite: false,
  ),
  Product(
    id: 'p3',
    title: 'Yellow Scarf',
    description: 'Warm and cozy - exactly what you need for the winter.',
    price: 19.99,
    image: 'assets/images/product3.png',
    isFavorite: false,
  ),
  Product(
      id: 'p4',
      title: "Keyboard",
      description: "RGB Keyboard",
      price: 29.99,
      image: 'assets/images/product4.png',
      isFavorite: false)
];










class ProductBox extends StatefulWidget {
  ProductBox({
    required this.product,
  });

  Product product;

  @override
  State<ProductBox> createState() => _ProductState();
}

class _ProductState extends State<ProductBox> {
  void toggleFavoriteStatus() {
    widget.product.isFavorite = !widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0x2D585866),
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: 230,
        child: Card(
          elevation: 20,
          color: Color(0xff585866),
          margin: EdgeInsets.all(9),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(widget.product.image),
                height: 110,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ " + widget.product.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        IconButton(
                          icon: Icon(
                            widget.product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: widget.product.isFavorite
                              ? Colors.red
                              : Colors.white,
                          onPressed: () {
                            setState(() {
                              toggleFavoriteStatus();
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }



}

