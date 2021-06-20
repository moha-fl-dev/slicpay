import 'package:flutter/material.dart';

class FeaturedWidget extends StatefulWidget {
  const FeaturedWidget({Key? key}) : super(key: key);

  @override
  _FeaturedWidgetState createState() => _FeaturedWidgetState();
}

class _FeaturedWidgetState extends State<FeaturedWidget> {
  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam feugiat ante vitae volutpat eleifend. Vivamus sagittis elementum fringilla. Fusce venenatis metus porttitor, lacinia est et, scelerisque lorem. Integer quis diam eget diam accumsan tristique ac eu nunc. Cras hendrerit iaculis arcu, eget consequat ipsum pellentesque eu. Vivamus massa mi, dignissim a eleifend id, mollis quis felis. Sed laoreet libero nec mauris facilisis hendrerit. Sed tristique magna eu mattis tempus.";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        width: double.infinity,
        height: 175.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 4,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
