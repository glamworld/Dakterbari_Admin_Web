import 'package:admin_panel_web/providers/blog_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/comment_modal.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/no_data_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleDetails extends StatefulWidget {
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final BlogProvider articleProvider = Provider.of<BlogProvider>(context);
    return Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _bodyUI(articleProvider,publicProvider),
        )
        );
  }
  Widget _bodyUI(BlogProvider articleProvider,PublicProvider publicProvider) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _articleDetails(size,articleProvider,publicProvider),
          _divider(),

          ///Comment builder
          _sectionHeading('All comments'),
          SizedBox(height: 5),
          articleProvider.articleCommentList.isNotEmpty?
          ListView.builder(
            itemCount: articleProvider.articleCommentList.length>2? 2
                : articleProvider.articleCommentList.length,
            shrinkWrap: true,
            itemBuilder: (context, index)=> _commentTile(index,size),
          )
              :NoData(message: 'No comments yet \u{1f614}'),

          articleProvider.articleCommentList.length>2? Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: ()=> ViewAllComment(context),
              child: Text("View all comments",textAlign: TextAlign.end,style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),),
            ),
          ):Container(),
          _divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GradientButton(
                      child: Text('Update'),
                      onPressed: ()async{
                        publicProvider.category=publicProvider.subCategory;
                        publicProvider.subCategory='Update Blog';
                      }, borderRadius: 3.0,
                      height: size.height*.05,
                      width: size.width*.2,
                      gradientColors: [
                        Theme.of(context).primaryColor,
                        Colors.green
                      ]),


              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _isLoading? spinWave():GradientButton(
                    child: Text('Delete'),
                    onPressed: ()async{
                      showDialog(
                        context: context,
                        builder: (context) {
                          Widget okButton = FlatButton(
                            child: Text("YES"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                _isLoading=true;
                              });
                              articleProvider.deleteBlog(publicProvider.articleModel.id!, context).then((value){
                                articleProvider.getAllArticle();
                                setState(() {
                                  _isLoading=false;
                                });
                              });

                            },
                          );
                          Widget noButton = FlatButton(
                            child: Text("No"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                          AlertDialog alert = AlertDialog(
                            title: Text("Are you sure you want to delete this Blog?"),
                            content: Text("This Blog will be deleted"),
                            actions: [
                              noButton,
                              okButton
                            ],
                          );
                          return alert;
                        },
                      );
                    }, borderRadius: 3.0,
                    height: size.height*.05,
                    width: size.width*.2,
                    gradientColors: [
                      Colors.red,
                      Colors.redAccent
                    ]),


              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _articleDetails(Size size, BlogProvider articleProvider,PublicProvider publicProvider) {
    return Column(
      children: [
        ///Image Section...
        Container(
          height: size.width * .12,
          width: size.width*.6,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: publicProvider.articleModel.photoUrl!,
              width: size.width,
              height: size.width * .65,
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/loadingimage.gif', height: size.width * .65,
                  width: size.width,fit: BoxFit.fitHeight,),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),

              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),

        ///Title Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            publicProvider.articleModel.title!,
            textAlign: TextAlign.justify,

            style: TextStyle(
                color: Colors.grey[900],
                fontSize: size.width*.045,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),

        ///Date, like, share Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.date_range, color: Theme.of(context).primaryColor),
                  SizedBox(width: 4),
                  Text(
                    publicProvider.articleModel.date!,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${publicProvider.articleModel.like??'0'}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.suit_heart,
                    color: Colors.pink,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${publicProvider.articleModel.share??'0'}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.arrowshape_turn_up_right,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10),

        ///Writer Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: publicProvider.articleModel.authorPhoto==null? AssetImage('assets/male.png') as ImageProvider
                        :NetworkImage(publicProvider.articleModel.authorPhoto!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              SizedBox(width: 5),
              Text(
                publicProvider.articleModel.author!,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        ///Abstract Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Abstract: ${publicProvider.articleModel.abstract!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),

        ///Introduction Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Introduction: ${publicProvider.articleModel.introduction!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ///Methods Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Methods: ${publicProvider.articleModel.methods!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ///Results Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Results: ${publicProvider.articleModel.results!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ///Conclusion Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Conclusion: ${publicProvider.articleModel.conclusion!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ///Acknowledgement Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Acknowledgement: ${publicProvider.articleModel.acknowledgement!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ///References Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'References: ${publicProvider.articleModel.reference!}',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _divider() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Divider(
          color: Theme.of(context).primaryColor,
        ));
  }

  Widget _sectionHeading(String heading){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(heading,style: TextStyle(
          color: Colors.grey[600],
          fontSize: 17,
          fontWeight: FontWeight.w500),),
    );
  }

  Widget _commentTile(int index, Size size) {
    return Consumer<BlogProvider>(
      builder: (context, articleProvider, child){
        return Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * .11,
                height: size.width * .11,
                decoration: BoxDecoration(
                  color: Color(0xffAAF1E8),
                  image: DecorationImage(
                    image: articleProvider.articleCommentList[index].commenterPhoto==null? AssetImage('assets/male.png') as ImageProvider
                        :NetworkImage(articleProvider.articleCommentList[index].commenterPhoto!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              SizedBox(width: size.width * .01),
              Container(
                width: size.width * .81,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(articleProvider.articleCommentList[index].commenterName
                        ,style: TextStyle(fontSize: 13, color: Colors.grey[900],fontWeight: FontWeight.bold)),
                    ExpandableText(
                      articleProvider.articleCommentList[index].comment,
                      expandText: 'more',
                      collapseText: 'less',
                      maxLines: 2,
                      linkColor: Theme.of(context).primaryColor,
                      style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                    ),
                    Text(
                      articleProvider.articleCommentList[index].commentDate,
                      style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
