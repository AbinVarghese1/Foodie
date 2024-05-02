
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Recipe Detail Page

class RecipeDetailPage extends StatefulWidget {
  final String recipeId; // Use RecipeID instead of doc ID

  RecipeDetailPage({required this.recipeId});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<DocumentSnapshot> _recipeData; // Fetch recipe details
  bool isFavorite = false; // Check if the recipe is marked as favorite

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Fetch the recipe data using the RecipeID
    _recipeData = FirebaseFirestore.instance
        .collection("recipe") // Ensure this collection name is consistent
        .where("RecipeID", isEqualTo: widget.recipeId) // Fetch based on RecipeID
        .limit(1) // Expect only one result
        .get()
        .then((snapshot) => snapshot.docs.first);

    _checkIfFavorite(); // Check if the recipe is in the user's favorites
  }

  Future<void> _checkIfFavorite() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return;
    }

    final favCollection = FirebaseFirestore.instance.collection('favorites');

    final existingFavorite = await favCollection
        .where('UserId', isEqualTo: user.uid)
        .where('RecipeID', isEqualTo: widget.recipeId) // Consistent handling as a string
        .get();

    setState(() => isFavorite = existingFavorite.docs.isNotEmpty);
  }

  Future<void> _toggleFavorite() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return;
    }

    final favCollection = FirebaseFirestore.instance.collection('favorites');

    final existingFavorite = await favCollection
        .where('UserId', isEqualTo: user.uid)
        .where('RecipeID', isEqualTo: widget.recipeId) // Consistent handling
        .get();

    if (existingFavorite.docs.isNotEmpty) {
      await favCollection.doc(existingFavorite.docs.first.id).delete();
      setState(() => isFavorite = false);
    } else {
      await favCollection.add({
        'UserId': user.uid,
        'RecipeID': widget.recipeId, // Store RecipeID as a string
      });
      setState(() => isFavorite = true);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: _recipeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("An error occurred while fetching the recipe details."));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text("Recipe not found.")); // Handle case when recipe is not found
          }

          var recipeData = snapshot.data!.data() as Map<String, dynamic>;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width - 20,
                child: Stack(
                  children: [
                    FutureBuilder<String>(
                      future: _getImageUrl(recipeData["Image_Name"]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(child: Text("Error loading image."));
                        }

                        if (snapshot.hasData) {
                          return Image.network(
                            snapshot.data!,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.width - 20,
                          );
                        }

                        return Center(child: Text("Image not available"));
                      },
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(CupertinoIcons.chevron_back),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                recipeData["Title"],
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: IconButton(
                                icon: Icon(isFavorite ? Icons.favorite : Icons.add),
                                onPressed: _toggleFavorite,
                                tooltip: isFavorite ? "Remove from favorites" : "Add to favorites",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(text: "Overview"),
                            Tab(text: "Ingredients"),
                            Tab(text: "Directions"),
                            Tab(text: "Reviews"),
                          ],
                        ),
                        Container(
                          height: 350, // Explicit height to avoid layout issues
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cook Time: ${recipeData["CookTime"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Cuisine: ${recipeData["Cuisine"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ingredients:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ...(recipeData["Ingredients"])
                                        .split(',')
                                        .map((ingredient) => Text(
                                              ingredient.trim(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            )),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Instructions:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ...(recipeData["Instructions"].split('\n'))
                                        .map((instruction) => Padding(
                                              padding: EdgeInsets.only(bottom: 8),
                                              child: Text(
                                                instruction.trim(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            )),
                                  ],
                                ),
                              ),
                              Center(child: Text("No reviews yet")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<String> _getImageUrl(String imageName) async {
    final ref = FirebaseStorage.instance.ref().child('images/$imageName.jpg');
    return ref.getDownloadURL(); // Fetch the image URL from Firebase Storage
  }
}
