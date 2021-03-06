import 'package:flutter/material.dart';
import 'package:olxapp/model/post_response.dart';
import 'package:olxapp/utilis/space.dart';
class CardShape extends StatelessWidget {
  PostResponse postResponse;
  String type;
  Function onpressed;
  CardShape({this.postResponse,this.type,this.onpressed});
  @override
  Widget build(BuildContext context) {
      return Padding(
          padding: EdgeInsets.all(Space().getHeight(context)/100),
          child: Container(
            color: Colors.grey,

            width: Space().getWidth(context)*0.4,
            height: Space().getHeight(context)*0.2,
            child:
            Card(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: Space().getWidth(context)*0.4,
                      height: Space().getHeight(context)*0.2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                        ),
                        child: Image.network(
                          postResponse.imagepath,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null)
                              return child;
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                      )
                  ),
                  SizedBox(width: Space().getWidth(context)/30,),
                  information(postResponse)
                ],
              ),
            ),


          ));

  }
  Widget information(PostResponse post){
    return Container(child:
    Expanded(
      child: type!='myposts'?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Expanded(child: informationShape(Icons.title, post.title)),

          Expanded(child: informationShape(Icons.description, post.description)),



          Expanded(child: informationShape(Icons.location_on, post.location)),



          Expanded(child: informationShape(Icons.phone, post.phone)),






        ],
      ):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Expanded(child: informationShape(Icons.title, post.title)),

          Expanded(child: informationShape(Icons.description, post.description)),



          Expanded(child: informationShape(Icons.location_on, post.location)),



          Expanded(child: informationShape(Icons.phone, post.phone)),
          Expanded(child: InkWell(child: Icon(Icons.delete,color: Colors.white,),onTap: onpressed

          ))






        ],
      ),
    ));
  }
  Widget informationShape(icon,String title){
    return title=='description'?
    Expanded(
      child: Padding(
        
        child: Row(
          children: <Widget>[
            Icon(icon,color: Colors.red,),

            Expanded(
              child: Text(title,style: (TextStyle(
                color: Colors.white,


              )),
                maxLines: 3,
              ),
            ),
          ], ),
      ),
    ):Row(
      children: <Widget>[
        Icon(icon,color: Colors.red,),

        Expanded(
          child: Text(title,style: (TextStyle(
            color: Colors.white,


          )),
            maxLines: 3,
          ),
        ),
      ], );





  }
}
