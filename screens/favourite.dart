import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie_buddy/screens/home/recipe_detail.dart';


class FavouritePage extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<FavouritePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
          leading: BackButton(),
        ),
        body: Center(child: Text("Please log in to see your favorites")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        leading: BackButton(),
      ),
      backgroundColor: Color(0xFFC9EFC6),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
          .collection("favorites")
          .where("UserId", isEqualTo: user.uid)
          .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading favorites"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No favorite recipes found"));
          }

          // Retrieve RecipeIDs from the 'favorites' collection
          var favorites = snapshot.data!.docs
            .map((doc) => doc["RecipeID"] as String)
            .toList();

          // Fetch detailed information about each favorite recipe
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: _getFavoriteRecipeDetails(favorites),
            builder: (context, favSnapshot) {
              if (favSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (favSnapshot.hasError) {
                return Center(child: Text("Error loading favorite recipes"));
              }

              if (favSnapshot.data == null || favSnapshot.data!.isEmpty) {
                return Center(child: Text("No favorite recipes found"));
              }

              // Display the list of favorite recipes
              return ListView.builder(
                itemCount: favSnapshot.data!.length,
                itemBuilder: (context, index) {
                  final recipe = favSnapshot.data![index];
                  return _buildRecipeWidget(recipe); // Updated to use proper widget
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _getFavoriteRecipeDetails(List<String> recipeIds) async {
    var futures = recipeIds.map(
      (id) => _firestore
        .collection("recipe") // Collection where the recipes are stored
        .where("RecipeID", isEqualTo: id) // Fetch based on RecipeID
        .limit(1)
        .get()
    );

    var results = await Future.wait(futures);

    return results
      .where((snapshot) => snapshot.docs.isNotEmpty) // Ensure document exists
      .map((snapshot) => snapshot.docs.first.data() as Map<String, dynamic>)
      .toList();
  }

  Widget _buildRecipeWidget(Map<String, dynamic> recipe) {
    final imageName = recipe["Image_Name"];
    final title = recipe["Title"];
    final cookTime = recipe["CookTime"];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailPage(recipeId: recipe["RecipeID"]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            FutureBuilder<String>(
              future: _storage.ref("images/$imageName.jpg").getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 160,
                    width: 160,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasError) {
                  return SizedBox(
                    height: 160,
                    width: 160,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return SizedBox(
                    height: 160,
                    width: 160,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                return Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!), // Fetch image URL from Storage
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Cooking Time: ${cookTime ?? 'Unknown'}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
