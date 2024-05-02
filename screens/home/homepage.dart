import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie_buddy/components/bottomnavigation.dart';
import 'package:foodie_buddy/screens/home/courses/courses.dart';
import 'package:foodie_buddy/screens/home/cuisines/cuisines.dart';
import 'package:foodie_buddy/screens/home/diets/Dishes.dart';
import 'package:foodie_buddy/screens/home/popular_widget.dart';
import 'package:foodie_buddy/screens/home/recipe_detail.dart';

class Recipe {
  final String id; // Using RecipeID from the document
  final String title;
  final String imageName;

  Recipe({
    required this.id,
    required this.title,
    required this.imageName,
  });

  factory Recipe.fromDocument(DocumentSnapshot doc) {
    return Recipe(
      id: doc['RecipeID'] as String, // Use the RecipeID field from the document
      title: doc['Title'] as String,
      imageName: doc['Image_Name'] as String,
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<homepage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Recipe> _recipes = [];
  List<RecipePopular> _popularRecipes = [];
  bool _isLoading = true;

  TextEditingController _searchController = TextEditingController();
  List<Recipe> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
    _fetchPopularRecipes();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchRecipes() async {
    final querySnapshot = await _firestore.collection('recipe').get();
    final recipes = querySnapshot.docs.map((doc) => Recipe.fromDocument(doc)).toList();

    setState(() {
      _recipes = recipes;
      _isLoading = false;
    });
  }

  Future<void> _fetchPopularRecipes() async {
    final querySnapshot = await _firestore.collection('recipe').get();
    final popularRecipes = querySnapshot.docs.map((doc) => RecipePopular.fromDocument(doc)).toList();

    setState(() {
      _popularRecipes = popularRecipes;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
    } else {
      _searchRecipes(query);
    }
  }

  Future<void> _searchRecipes(String query) async {
    final querySnapshot = await _firestore
        .collection('recipe')
        .where('Title', isGreaterThanOrEqualTo: query)
        .where('Title', isLessThan: query + '\uf8ff') // For prefix matching
        .get();

    final recipes = querySnapshot.docs.map((doc) => Recipe.fromDocument(doc)).toList();

    setState(() {
      _searchResults = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  pinned: false,
                  expandedHeight: 10,
                  backgroundColor: Colors.transparent,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 20),
                      child: _buildProfileIcon(),
                    ),
                  ],
                  title: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16, right: 8),
                    child: _buildSearchBar(),
                  ),
                ),
                _searchResults.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final recipe = _searchResults[index];
                            return _buildSearchResultItem(recipe);
                          },
                          childCount: _searchResults.length,
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/images/explore.png"),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Categories",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildCategoryButton("Courses", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CoursesPage()),
                                    );
                                  }),
                                  _buildCategoryButton("Cuisines", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CuisinePage()),
                                    );
                                  }),
                                  _buildCategoryButton("Dishes", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DishesPage()),
                                    );
                                  }),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Top Recipes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _recipes.length,
                                  itemBuilder: (context, index) {
                                    return _buildRecipeWidget(_recipes[index]);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Popular Recipes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final recipe = _popularRecipes[index];
                      return PopularWidget(
                        recipe: recipe,
                        firestore: _firestore,
                        storage: _storage,
                        auth: _auth,
                      );
                    },
                    childCount: _popularRecipes.length,
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
       child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
      ),
    ));
  }

  Widget _buildSearchResultItem(Recipe recipe) {
    return ListTile(
      leading: FutureBuilder<String>(
        future: _storage.ref('images/${recipe.imageName}.jpg').getDownloadURL(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          return CircleAvatar(
            backgroundImage: NetworkImage(snapshot.data!),
          );
        },
      ),
      title: Text(recipe.title),
      onTap: () {
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute(builder: (context) => RecipeDetailPage(recipeId: recipe.id)),
            );
          },
    );
  }

  Widget _buildProfileIcon() {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage('assets/images/profile.png'),
    );
  }

 Widget _buildCategoryButton(String title, Function onPressed) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeWidget(Recipe recipe) {
    return FutureBuilder<String>(
      future: _storage.ref('images/${recipe.imageName}.jpg').getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error loading image'));
        }

        String? imageUrl = snapshot.data;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailPage(recipeId: recipe.id),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(right: 16),
            width: 220,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
