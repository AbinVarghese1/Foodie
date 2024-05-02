


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie_buddy/screens/home/popular_widget.dart';

class CuisinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(), // add this line to add the back button
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(start: 64, bottom: 12), // adjust the title padding
              title: Text('Cuisines', style: TextStyle(fontSize: 20, color: Colors.black)),
              centerTitle: false,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AmericanPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('American'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/American.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BarbecuePage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Barbecue'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Barbecue.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AsianPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Asian'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Asian.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItalianPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Italian'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Italian.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MexicanPage()),
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
                            offset: const Offset(0, 3),
                ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Mexican'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Mexican.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FrenchPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('French'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/French.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndianPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Indian'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Indian.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChinesePage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Chinese'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Chinese.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpanishPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('Spanish'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/Spanish.jpg'), // replace with your image
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GermanPage()),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const ListTile(
                        title: Text('German'),
                        trailing: CircleAvatar(
                          backgroundImage: AssetImage('assets/cuisinesimage/German.jpg'), // replace with your image
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

class AmericanPage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(' American', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return const Center(child: Text("No  American available")); // Fallback when no data
    }
  },
),
      );
  }
}

class BarbecuePage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Barbecue', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return const Center(child: Text("No Barbecue available")); // Fallback when no data
    }
  },
),
      );
  }
}

class AsianPage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Asian', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return const Center(child: Text("No Asian available")); // Fallback when no data
    }
  },
),
      );
  }
}

class ItalianPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Italian', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return const Center(child: Text("No Italian available")); // Fallback when no data
    }
  },
),
      );
  }
}

class MexicanPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Mexican', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return const Center(child: Text("No Mexican available")); // Fallback when no data
    }
  },
),
      );
  }
}

class FrenchPage extends StatelessWidget {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 4.0,
            backgroundColor: Color(0xFFC9EFC6),
            pinned: true,
            floating: true,
            expandedHeight: 100,
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('French', style: TextStyle(fontSize: 20, color: Colors.black)),
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
      return const Center(child: Text("No French available")); // Fallback when no data
    }
  },
),
      );
  }
}

class IndianPage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
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
      return const Center(child: Text("No Soups available")); // Fallback when no data
    }
  },
),
      );
  }
}

class ChinesePage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
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
      return const Center(child: Text("No Soups available")); // Fallback when no data
    }
  },
),
      );
  }
}

class SpanishPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
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
      return const Center(child: Text("No Soups available")); // Fallback when no data
    }
  },
),
      );
  }
}

class GermanPage extends StatelessWidget {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9EFC6), // Background color
      body:FutureBuilder<QuerySnapshot>(
  future: _firestore
      .collection("recipe") // Check if this is the correct collection name
      .where("Courses", isEqualTo: "Appetizer") // Correct spelling if needed
      .get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error fetching data")); // Error handling
    }

    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      // Correctly map documents to List<RecipePopular> with explicit type casting
      List<RecipePopular> recipes = snapshot.data!.docs
          .map((doc) => RecipePopular.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return CustomScrollView(
        slivers: [
          const SliverAppBar(
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
      return const Center(child: Text("No Soups available")); // Fallback when no data
    }
  },
),
      );
  }
}

