class Product{
  int? id;
  String? name;
  int? price;
  int?  stockQuantity;
  Product({required this.id,required this.name,required this.price,required this.stockQuantity});

}
class ShoppingCart{
  Map<Product, int> cartItem={};
  void addProducts(Product products, int quantity){
    try{
      if(products.stockQuantity! >= quantity){
        cartItem.update(products, (existingQuantity)=> existingQuantity + quantity, ifAbsent: ()=> quantity);
      }else{
        throw Exception("Not enough stock for ${products.name}");
      }
    }catch(e){
      print(e);
    }
  }

  void removeProducts(Product products, int quantity){
    try{
      if(cartItem.containsKey(products) &&  cartItem[products]! >=quantity){//cartItem[products] != null &&
        cartItem.update(products, (existingQuantity)=>existingQuantity-quantity);
        products.stockQuantity = quantity;
        if(cartItem[products]==0){
          cartItem.remove(products);
        }
        print("$quantity ${products.name} (s) removed from the cart");
      }else{
        throw Exception('Cannot remove $quantity ${products.name}(s) from the cart.');
      }
    }catch(e){
      print(e);
    }
  }
  double calculateTotal() {
    double total = 0.0;
    cartItem.forEach((product, quantity) {
      total += product.price! * quantity;
    });
    return total;
  }
  Future<void> checkout() async {
    print('Processing checkout...');
    await Future.delayed(Duration(seconds: 2)); // Simulate async operation
    cartItem.clear();
    print('Checkout completed.');
  }


}
main (){
  Product apple= Product(id: 01, name: "Apple", price: 260, stockQuantity: 7);
  Product banana = Product(id: 02, name: "Banana", price: 40, stockQuantity: 10);

  ShoppingCart cart = ShoppingCart();
  cart.addProducts(apple, 5); 
  cart.addProducts(banana, 10);

  print('Total price: \$${cart.calculateTotal()}');
  cart.removeProducts(apple, 2); 
  print('Total price after removal: \$${cart.calculateTotal()}');
  cart.checkout();
}