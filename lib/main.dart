import 'dart:io';


class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> cart = [];

  void addProduct(Product product) {
    cart.add(product);
    print('${product.name} added to your cart.');
  }

  void viewCart() {
    if (cart.isEmpty) {
      print('Your cart is empty.');
    } else {
      double total = 0;
      print('\nYour Cart:');
      for (var product in cart) {
        print('${product.name} - \$${product.price}');
        total += product.price;
      }
      print('Total Cost: \$${total}\n');
    }
  }
}

void main() {
  List<Product> products = [
    Product('Laptop', 800.0),
    Product('Phone', 500.0),
    Product('Headphones', 50.0),
    Product('Keyboard', 30.0),
  ];

  ShoppingCart cart = ShoppingCart();

  while (true) {
    print('\nAvailable Products:');
    for (int i = 0; i < products.length; i++) {
      print('${i + 1}. ${products[i].name} - \$${products[i].price}');
    }
    print('5. View Cart');
    print('6. Exit');

    stdout.write('Enter your choice: ');
    String? input = stdin.readLineSync();

    if (input == '6') {
      print('Exiting the application...');
      break;
    } else if (input == '5') {
      cart.viewCart();
    } else {
      int? choice = int.tryParse(input!);
      if (choice != null && choice > 0 && choice <= products.length) {
        cart.addProduct(products[choice - 1]);
      } else {
        print('Invalid choice. Please try again.');
      }
    }
  }
}
