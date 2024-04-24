import 'package:flutter/material.dart';

// ignore: camel_case_types
class messenger extends StatelessWidget {
  const messenger({super.key});

  @override             // مخصصه للصفحة
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 20,
        title:  Row(
          children: [
            CircleAvatar(
              radius: 25.00,
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/fairytailwarcraftage/images/e/ea/Natsu_Dragneel.png/revision/latest?cb=20160623134524'),
            ),
            SizedBox(
              width: 15,

            ),
            Text(
              'chat',
            ),

          ],
        ),
        actions: [
          IconButton(
              icon:  Icon(

                Icons.camera_alt,
              ), onPressed:(){}),
          IconButton(
              icon:  Icon(

                Icons.edit,
              ), onPressed:(){})
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10),

                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('search'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(

                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // مخصصة ل القائمة
                  itemBuilder: (context,index) => buildStoreItem(),
                  itemCount: 4,
                  separatorBuilder: (BuildContext context,  index) =>  SizedBox(
                    width: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 20.00,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:( context , index ) => buildChatItem (),
                separatorBuilder:( context , index ) =>  SizedBox(
                  height: 20,
                ) ,
                itemCount:  22,
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem () => Row(
    children: [

      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.00,
            backgroundImage: NetworkImage('https://static.wikia.nocookie.net/fairytailwarcraftage/images/e/ea/Natsu_Dragneel.png/revision/latest?cb=20160623134524'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 5,
            ),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'natsu0.7',
              style:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,

              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'the final edit is veryfghdfthgyjhry good i love it',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '2:00 pm',
                ),
              ],
            )
          ],

        ),
      ),

    ],
  );
  Widget buildStoreItem () =>  Container(
    width: 60,

    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.00,
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/fairytailwarcraftage/images/e/ea/Natsu_Dragneel.png/revision/latest?cb=20160623134524'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(1, 20, 8, 1),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Text('natsu0.7natsu0.7natsu0.7natsu0.7natsu0.7',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
