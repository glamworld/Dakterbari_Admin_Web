import 'package:admin_panel_web/model/article_model.dart';
import 'package:admin_panel_web/providers/blog_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:admin_panel_web/widgets/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllBlogPage extends StatefulWidget {
  @override
  _AllBlogPageState createState() => _AllBlogPageState();
}

class _AllBlogPageState extends State<AllBlogPage> {
  int _index=0;
  String text="All Posts";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final BlogProvider blogProvider = Provider.of<BlogProvider>(context);
    _index==1?text='News':_index==2?text='Diseases & Cause':_index==3?text='Health Tips':
    _index==4?text='Food & Nutrition':_index==5?text='Medicine & Treatment':_index==6?text='Medicare & Hospital':
    _index==7?text='Tourism & Cost':_index==8?text='Symptoms':_index==9?text='Visual Story':text='All Posts';
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(children: [
                  Expanded(
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: StaticVariables.articleCategoryItems.length,
                        itemBuilder: (context, index) {
                          var category=StaticVariables.articleCategoryItems[index];
                          return Row(
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100))),
                                  child: Center(
                                    child: Text(
                                      StaticVariables.articleCategoryItems[index],
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  width: size.width * .15,
                                  height: size.width * .2,
                                ),
                                onTap: (){
                                  setState(() {
                                    category=='News'?_index=1:category=='Diseases & Cause'?_index=2
                                    :category=='Health Tips'?_index=3:category=='Food & Nutrition'?_index=4:
                                    category=='Medicine & Treatment'?_index=5:category=='Medicare & Hospital'?_index=6
                                    :category=='Tourism & Cost'?_index=7:category=='Symptoms'?_index=8: _index=9;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        }),
                  ),
                ]),
              ),
            ),
          ),
          _viewAllSection(text),
          SizedBox(height: size.width / 50),
          _index==1?blogProvider.newsArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.newsArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==2?blogProvider.diseasesArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.diseasesArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==3?blogProvider.healthArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.healthArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==4?blogProvider.foodArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.foodArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==5?blogProvider.medicineArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.medicineArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==6?blogProvider.medicareArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.medicareArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==7?blogProvider.tourismArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.tourismArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==8?blogProvider.symptomsArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.symptomsArticleList)
              : NoData(message: 'No Post \u{1f614}'):_index==9?blogProvider.visualArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.visualArticleList)
              : NoData(message: 'No Post \u{1f614}'):blogProvider.allArticleList.isNotEmpty
              ? _postBuilder('all', blogProvider.allArticleList)
              : NoData(message: 'No Post \u{1f614}'),
          //SizedBox(height: size.width / 10),
        ],
      ),
    );
  }

  Widget _viewAllSection(String categoryName) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            categoryName,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          //Text("View all",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _postBuilder(String identifier, List<ArticleModel> list) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: size.height*.785,
        width: size.width,
        //color: Colors.grey,
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return PostTile(identifier: identifier, index: index, list: list);
            })
    );
  }
}

class PostTile extends StatefulWidget {
  int index;
  String? identifier;
  List<ArticleModel>? list;

  PostTile({this.identifier, required this.index, this.list});
  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Consumer<BlogProvider>(
      builder: (context, articleProvider, child) {
        return GestureDetector(
          onTap: () async {
            await articleProvider
                .getArticleComments(widget.list![widget.index].id!)
                .then((value) {
              publicProvider.category=publicProvider.subCategory;
              publicProvider.subCategory='Blog Details';
              setState(() {
                publicProvider.articleModel.id=widget.list![widget.index].id;
                publicProvider.articleModel.photoUrl=widget.list![widget.index].photoUrl;
                publicProvider.articleModel.date=widget.list![widget.index].date;
                publicProvider.articleModel.title=widget.list![widget.index].title;
                publicProvider.articleModel.author=widget.list![widget.index].author;
                publicProvider.articleModel.authorPhoto=widget.list![widget.index].authorPhoto;
                publicProvider.articleModel.like=widget.list![widget.index].like;
                publicProvider.articleModel.share=widget.list![widget.index].share;
                publicProvider.articleModel.category=widget.list![widget.index].category;
                publicProvider.articleModel.abstract=widget.list![widget.index].abstract;
                publicProvider.articleModel.state=widget.list![widget.index].state;
                publicProvider.articleModel.introduction=widget.list![widget.index].introduction;
                publicProvider.articleModel.methods=widget.list![widget.index].methods;
                publicProvider.articleModel.results=widget.list![widget.index].results;
                publicProvider.articleModel.conclusion=widget.list![widget.index].conclusion;
                publicProvider.articleModel.acknowledgement=widget.list![widget.index].acknowledgement;
                publicProvider.articleModel.reference=widget.list![widget.index].reference;
                publicProvider.articleModel.doctorId=widget.list![widget.index].doctorId;
              });
            });
          },
          child: Container(
            // width: 200,
            // height: 200,
            margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 2.5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2.0, offset: Offset(0, 1))
                ]),
            child: Stack(
              children: [
                ///Image
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 170,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: widget.list![widget.index].photoUrl!,
                              width: 400,
                              height: 150,
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/loadingimage.gif',
                                  height: 150,
                                  width: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),

                        ///Title, date, description
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Title...
                              Container(
                                  width: 300,
                                  child: Text(
                                    widget.list![widget.index].title!,
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(height: 5),
                              //Vertical line
                              Container(
                                height: 3,
                                width: 300,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(height: 5),
                              //Date...
                              Container(
                                  width: 300,
                                  child: Text(
                                    widget.list![widget.index].date!,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(height: 20),
                              //Description...
                              Container(
                                  width: 300,
                                  child: Text(
                                    widget.list![widget.index].abstract!,
                                    maxLines: 5,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        )
                      ],
                    )),

                ///Footer (like & share)
                Positioned(
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: 40,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${widget.list![widget.index].like ?? '0'}",
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
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${widget.list![widget.index].share ?? '0'}",
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
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

