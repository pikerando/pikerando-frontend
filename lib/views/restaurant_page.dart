import 'package:api_demo/models/restaurant_to.dart';
import 'package:api_demo/services/Restaurant_api.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  @override
  RestaurantListPageState createState() => RestaurantListPageState();
}

class RestaurantListPageState extends State<RestaurantPage> {
  List<RestaurantTo>? restaurants;
  int? clickedRestaurantId;

  @override
  void initState() {
    super.initState();
    getData();
    // Fetch the list of restaurants from the server
  }

  getData() async {
    restaurants = await RestaurantServiceAPI().listRestaurants();
    if (restaurants != null) {
      setState(() {
        restaurants = restaurants;
      });
    }
  }

  void _onRestaurantClicked(int id) {
    setState(() {
      clickedRestaurantId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: restaurants == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: restaurants!.length,
              itemBuilder: (context, index) {
                RestaurantTo? restaurant = restaurants![index];
                return Card(
                  child: ListTile(
                    title: Text(restaurant.name),
                    onTap: () => _onRestaurantClicked(restaurant.id),
                  ),
                );
              },
            ),
    );
  }
}
