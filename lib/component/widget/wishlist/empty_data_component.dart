import 'package:flutter/material.dart';
import '../../../helper/imageStrings.dart';



SingleChildScrollView emptyDataComponent(String pageName) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
      child: Column(
        children: [
          Image.asset(
            pageName == "wishlist" ? ImageStrings.wishlistCharacter : ImageStrings.productCharacter,
            // height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            pageName == "wishlist" ? "Your wishlist is empty" : "We 're sorry",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black),
          ),
          Text(
            pageName == "wishlist" ?"Looks like you haven’t added anything to your wishlist yet " : "This product category is not available yet. We will be add very soon !!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(91, 110, 148,1),
              fontSize: 16,),
          ),
          const SizedBox(height: 50,),
          TextButton(
            onPressed: () {},
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                child: const Text("Explore Now    >",style: TextStyle(color: Colors.white),)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) {
                  // Return the desired text color based on the states
                  if (states.contains(MaterialState.disabled)) {
                    // Return the text color when the button is disabled
                    return Colors.orange.withOpacity(0.5); // Adjust opacity as needed
                  }
                  // Return the text color when the button is enabled
                  return Colors.orange;
                },
              ),
            ),
          )

        ],
      ),
    ),
  );
}
