import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/firestore/FireStorePost.dart';
import 'package:gp_app/service/Posts.dart';
import 'package:gp_app/service/Users.dart';
import 'package:gp_app/service/authentication.dart';
import 'package:gp_app/view/expert/Articles.dart';
import 'package:gp_app/view/expert/ArticlesCard.dart';
import 'package:gp_app/view/expert/ArticlesPage.dart';
import 'package:gp_app/view/profile/Listprofile.dart';
import 'package:gp_app/view/profile/postcard.dart';
import 'package:provider/provider.dart';
import '../../const.dart';
import 'CommentPage.dart';



class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var url ='http://localhost:8181/plant/expert';

  FireStorePost firestore;
  bool liked = false;
  _likedPost() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    Widget article = Container(
      height: 220,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(1.5),
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(articles.length, (index) {
          return ArticlesCard(
            details: Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image(
                  image: AssetImage(articles[index].articleImage),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.65),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.only(top: 150, left: 10),
                child: Text(
                  articles[index].title,
                  style: TextStyle(
                      fontSize: 25.00,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticlesPage(
                        articleImage: articles[index].articleImage,
                        articleTitle: articles[index].title,
                        articleDescription: articles[index].description),
                  ));
            },
          );
        }),
      ),
    );

    _commentPage(String image) {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CommentPage(image: image)));
      });
    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: kActiveBackButtonColor,
        title:  Center(
          child: Text("News Feed",  style: TextStyle(
            fontSize: 25.00,
            fontWeight: FontWeight.bold,
            color: KTextLightColour,
          ),),
        ),


      ),
    body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Most popular articles",
                    style: TextStyle(
                      fontSize: 25.00,
                      fontWeight: FontWeight.bold,
                      color: KTextLightColour,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                article,
                Container(
                  child: Column(
                      children: List.generate(x.length, (index) {
                    return PostCard(
                      details: Container(
                        width: mediaQuery.width,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Container(
                                    width: mediaQuery.width,
                                    child: ListTile(
                                       title: Text(
                                        (x[index].name),
                                        style: kWelcomeScreensTitleText,
                                      ),
                                      subtitle: Text(
                                        ("mennasayed@gmail.com"),
                                      ),
                                      leading: CircleAvatar(
                                          child: ClipOval(
                                        child: Image(
                                          height: 50.0,
                                          width: 50.0,
                                          image: AssetImage(
                                            x[index].image,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                      trailing: Container(
                                          // padding: EdgeInsets.only(left: 40),
                                          width: mediaQuery.width * 0.2,
                                          height: 30,
                                          child: GestureDetector(
                                            onTap: () async{
                                              print("sssssssssssssssssssssssssssssssss");
                                              print(  FireStorePost.retrieveAllPosts()   );
                                              print("sssssssssssssssssssssssssssssssss");
                                              //todo follow
                                              //todo هبد
                                          /* context
                                                  .read<AuthenticationService>()
                                                  .signOut();*/
                                          /* final FirebaseAuth auth = FirebaseAuth.instance;
                                              var now = new DateTime.now();

                                              Posts post = Posts(description: "fffff" ,photo: "" ,userID: auth.currentUser.uid, postID: now.toString());
                                              //   print(post.toJson());
                                              await  FireStorePost.addPost(post);
*/
                                            },
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: kInActiveOrangeColor,
                                              child: Center(
                                                child: Text('Follow',
                                                    style:
                                                        kWelcomeScreensTitleText),
                                              ),
                                            ),
                                          )),
                                    ),
                                  )
                                  //SizedBox(height: 15,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 500,
                              child: Image(
                                image: NetworkImage(
                                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/yucca-cane-plant-in-a-pot-on-a-white-background-royalty-free-image-1580856558.jpg'),
                                fit: BoxFit.cover,
                                height: 300,
                                width: 400,
                              ),
                            ),
                            Container(
                              width: mediaQuery.width,
                              //    color: Colors.black,
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                          liked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: liked
                                              ? Colors.green
                                              : Colors.green),
                                      iconSize: 30.0,
                                      onPressed: () => {
                                            _likedPost(),
                                            //todo postid liked bssssssssss
                                          }),
                                  IconButton(
                                    icon: Icon(Icons.chat_bubble_outline),
                                    iconSize: 30.0,
                                    color: Colors.green,
                                    onPressed: () {
                                      _commentPage(x[index].image);
                                    },
                                  ),
                                  SizedBox(
                                    width: 215,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.bookmark_border),
                                    iconSize: 30.0,
                                    color: Colors.green,
                                    onPressed: () => print('Save post'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: mediaQuery.width,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(x[index].name),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  //todo text flow over
                                  Text(
                                    x[index].description,
                                    style: kWelcomeScreensTitleText,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      //TODO LOVE   onPress: ,
                    );
                  })),
                ),
              ]),
        ),
      ),

    );
  }
}
