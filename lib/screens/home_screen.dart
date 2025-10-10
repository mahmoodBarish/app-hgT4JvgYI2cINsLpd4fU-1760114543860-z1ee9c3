import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 8),
                _buildLocation(),
                const SizedBox(height: 20),
                _buildSearchBar(),
                const SizedBox(height: 20),
                _buildBanner(),
                const SizedBox(height: 30),
                _buildProductSection('Exclusive Offer', _exclusiveOffers),
                const SizedBox(height: 30),
                _buildProductSection('Best Selling', _bestSelling),
                const SizedBox(height: 30),
                _buildGroceriesSection(),
                const SizedBox(height: 30),
                _buildProductSection('', _groceriesProducts, showHeader: false),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: SizedBox(
        width: 30,
        height: 35,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/244_790.png',
                width: 26,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 0,
              left: 8,
              child: Image.asset(
                'assets/images/244_789.png',
                width: 13,
                height: 11,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, color: Color(0xFF4C4F4D), size: 24),
        const SizedBox(width: 8),
        Text(
          'Dhaka, Banasree',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4C4F4D),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F3F2),
        hintText: 'Search Store',
        hintStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF7C7C7C),
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF181B19)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/244_238.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 20,
              top: 15,
              child: Image.asset(
                'assets/images/244_256.png',
                width: 122,
                height: 105,
              ),
            ),
            Positioned(
              right: 25,
              top: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fresh Vegetables',
                    style: GoogleFonts.aclonica(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF030303),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Get Up To 40% OFF',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF53B175),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF181725),
          ),
        ),
        TextButton(
          onPressed: () {
            context.push('/see-all');
          },
          child: Text(
            'See all',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF53B175),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductSection(String title, List<_Product> products,
      {bool showHeader = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader) _buildSectionHeader(title),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: _buildProductCard(products[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(_Product product) {
    return GestureDetector(
      onTap: () {
        context.push('/product-details/${product.name}');
      },
      child: Container(
        width: 173,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF181725),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.quantity,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: const Color(0xFF7C7C7C),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF181725),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF53B175),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroceriesSection() {
    return Column(
      children: [
        _buildSectionHeader('Groceries'),
        const SizedBox(height: 20),
        SizedBox(
          height: 105,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _groceryCategories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: _buildGroceryCategoryCard(_groceryCategories[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGroceryCategoryCard(_GroceryCategory category) {
    return GestureDetector(
      onTap: () {
        context.push('/category/${category.name}');
      },
      child: Container(
        width: 248,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Image.asset(
              category.imagePath,
              width: 72,
              height: 72,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                category.name,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3E423F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(230, 235, 243, 0.5),
            spreadRadius: 0,
            blurRadius: 37,
            offset: Offset(0, -12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF53B175),
          unselectedItemColor: const Color(0xFF181725),
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              activeIcon: Icon(Icons.store),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

class _Product {
  final String imagePath;
  final String name;
  final String quantity;
  final String price;

  const _Product({
    required this.imagePath,
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class _GroceryCategory {
  final String imagePath;
  final String name;
  final Color color;

  const _GroceryCategory({
    required this.imagePath,
    required this.name,
    required this.color,
  });
}

final List<_Product> _exclusiveOffers = [
  const _Product(
      imagePath: 'assets/images/244_323.png',
      name: 'Organic Bananas',
      quantity: '7pcs, Price',
      price: '\$4.99'),
  const _Product(
      imagePath: 'assets/images/244_373.png',
      name: 'Red Apple',
      quantity: '1kg, Price',
      price: '\$4.99'),
  const _Product(
      imagePath: 'assets/images/244_207.png',
      name: 'Beef Bone',
      quantity: '1kg, Price',
      price: '\$4.99'),
];

final List<_Product> _bestSelling = [
  const _Product(
      imagePath: 'assets/images/244_268.png',
      name: 'Bell Pepper Red',
      quantity: '1kg, Price',
      price: '\$4.99'),
  const _Product(
      imagePath: 'assets/images/244_272.png',
      name: 'Ginger',
      quantity: '250gm, Price',
      price: '\$4.99'),
  const _Product(
      imagePath: 'assets/images/244_217.png',
      name: 'Broiler Chicken',
      quantity: '1kg, Price',
      price: '\$4.99'),
];

final List<_GroceryCategory> _groceryCategories = [
  const _GroceryCategory(
      imagePath: 'assets/images/244_193.png',
      name: 'Pulses',
      color: Color(0xFFF8A44C)),
  const _GroceryCategory(
      imagePath: 'assets/images/244_197.png',
      name: 'Rice',
      color: Color(0xFF53B175)),
  const _GroceryCategory(
      imagePath: 'assets/images/244_193.png',
      name: 'Pulses',
      color: Color(0xFFF8A44C)),
];

final List<_Product> _groceriesProducts = [
  const _Product(
      imagePath: 'assets/images/244_207.png',
      name: 'Beef Bone',
      quantity: '1kg, Price',
      price: '\$4.99'),
  const _Product(
      imagePath: 'assets/images/244_217.png',
      name: 'Broiler Chicken',
      quantity: '1kg, Price',
      price: '\$4.99'),
  const _Product(
      imagePath: 'assets/images/244_272.png',
      name: 'Ginger',
      quantity: '250gm, Price',
      price: '\$4.99'),
];