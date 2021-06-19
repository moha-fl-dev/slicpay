/*
  random backgroundColor: ([...Colors.primaries]..shuffle()).first
  

  SingleChildScrollView( ///// very important
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
             Text('Hey'),
             ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:18,
                itemBuilder: (context,index){
                  return  Text('Some text');
                })
          ],
        ),
      ),

  Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.check),
          title: Text('TITLE'),
          subtitle: Text('SUBTITLE'),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: const Text('BTN1'),
              onPressed: () {/* ... */},
            ),
            FlatButton(
              child: const Text('BTN2'),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  );

    carousel builder
   // return Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.symmetric(horizontal: 5.0),
            //   decoration: BoxDecoration(
            //     image:
            //         DecorationImage(image: NetworkImage(i.imageUrl.toString())),
            //   ),
            //   child: Text(
            //     i.value.toString(),
            //     style: TextStyle(fontSize: 16.0),
            //   ),
            // );

*/
