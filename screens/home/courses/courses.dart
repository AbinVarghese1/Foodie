import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie_buddy/screens/home/homepage.dart';
import 'package:foodie_buddy/screens/home/popular_widget.dart';
class CoursesPage extends StatelessWidget {
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
              title: Text('Courses', style: TextStyle(fontSize: 20, color: Colors.black)),
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
                        MaterialPageRoute(builder: (context) => AppetizersPage()),
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
                        title: Text('Appetizers'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Appetizer.png'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SoupsPage()),
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
                        title: Text('Soups'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Soup.png'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BreakfastPage()),
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
                        title: Text('Breakfast And Brunch'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/MainDish.png'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LunchPage()),
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
                        title: Text('Lunch'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Lunch.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DessertsPage()),
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
                        title: Text('Desserts'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Dessert.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SaladsPage()),
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
                        title: Text('Salads'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Salad.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SideDishesPage()),
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
                        title: Text('Side Dishes'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/SideDish.png'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BeveragesPage()),
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
                        title: Text('Beverages'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Beverages.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SnacksPage()),
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
                        title: Text('Snacks'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Snacks.png'), // replace with your image
                          radius: 30,
                        ),
                      ),),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SaucesPage()),
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
                        title: Text('Sauces'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Sauce.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BreadsPage()),
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
                        title: Text('Breads'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/coursesimage/Bread.jpg'), // replace with your image
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
class AppetizersPage extends StatelessWidget {
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
              title: Text('Appetizers', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No appetizers available")); // Fallback when no data
    }
  },
),
      );
  }
}


class SoupsPage extends StatelessWidget {
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
              title: Text('Soups', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Soups available")); // Fallback when no data
    }
  },
),
      );
  }
}

class BreakfastPage extends StatelessWidget {
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
              title: Text('Breakfast', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No BreakfastPage available")); // Fallback when no data
    }
  },
),
      );
  }
}

class LunchPage extends StatelessWidget {
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
              title: Text('Lunch', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Lunch available")); // Fallback when no data
    }
  },
),
      );
  }
}

class DessertsPage extends StatelessWidget {
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
              title: Text('Desserts', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Desserts available")); // Fallback when no data
    }
  },
),
      );
  }
}

class SaladsPage extends StatelessWidget {
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
              title: Text('Salads', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Salads available")); // Fallback when no data
    }
  },
),
      );
  }
}

class SideDishesPage extends StatelessWidget {
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
              title: Text('SideDishes', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No SideDishes available")); // Fallback when no data
    }
  },
),
      );
  }
}

class BeveragesPage extends StatelessWidget {
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
              title: Text('Beverages', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Beverages available")); // Fallback when no data
    }
  },
),
      );
  }
}

class SnacksPage extends StatelessWidget {
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
              title: Text('Snacks', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Snacks available")); // Fallback when no data
    }
  },
),
      );
  }
}

class SaucesPage extends StatelessWidget {
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
              title: Text('Sauces', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Sauces available")); // Fallback when no data
    }
  },
),
      );
  }
}

class BreadsPage extends StatelessWidget {
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
              title: Text('Breads', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return Center(child: Text("No Breads available")); // Fallback when no data
    }
  },
),
      );
  }
}