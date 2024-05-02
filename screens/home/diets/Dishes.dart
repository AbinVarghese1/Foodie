import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie_buddy/screens/home/popular_widget.dart';

class DishesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(), // add this line to add the back button
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(start: 64, bottom: 12), // adjust the title padding
              title: Text('Dishes', style: TextStyle(fontSize: 20, color: Colors.black)),
              centerTitle: false,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CakePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Cake'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Cake.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CookiePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Cookie'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Cookie.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PiePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Pie'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Pie.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SandwichPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Sandwich'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Sandwich.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CupcakePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Cupcake'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Cupcake.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PizzaPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Pizza'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Pizza.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BurgerPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text('Burger'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/dishesimage/Burger.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CakePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Cake', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Cake available")); // Fallback when no data
    }
  },
),
      );
  }
}

class CookiePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Cookie', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Cookie available")); // Fallback when no data
    }
  },
),
      );
  }
}

class PiePage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Pie', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Pie available")); // Fallback when no data
    }
  },
),
      );
  }
}

class CupcakePage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Cupcake', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Cupcake available")); // Fallback when no data
    }
  },
),
      );
  }
}

class SandwichPage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sandwich', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Sandwich available")); // Fallback when no data
    }
  },
),
      );
  }
}

class PizzaPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Pizza', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Pizza available")); // Fallback when no data
    }
  },
),
      );
  }
}

class BurgerPage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Burger', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PopularWidget(
                  recipe: recipes[index], // Correctly assigned as RecipePopular
                  firestore: _firestore,
                  storage: FirebaseStorage.instance,
                  auth: FirebaseAuth.instance,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text("No Burger available")); // Fallback when no data
    }
  },
),
      );
  }
}
