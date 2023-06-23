import 'package:flutter/material.dart';

import '../../screen/home/learn/view/learn_detail_screen.dart';

class LearnCard extends StatelessWidget {
  const LearnCard(
      {Key? key,
      required this.toptext,
      required this.bodytext1,
      required this.bodytext2,
      required this.bodytext3,
      required this.bottomtext1,
      required this.bottomtext2,
      required this.image,
      required this.blogContent})
      : super(key: key);

  final String toptext;
  final String bodytext1;
  final String bodytext2;
  final String bodytext3;
  final String bottomtext1;
  final String bottomtext2;
  final String image;
  final String blogContent;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LearnDetailScreen(
            title: bodytext1,
            text: "Öğren",
            title2: bottomtext1,
            blogContent: blogContent,
            rate: 4.3,
            imagePath: image,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 20, bottom: 30, top: 10),
        width: MediaQuery.of(context).size.width * 0.78,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 23, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    color: const Color(0xFF303030),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  toptext,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bodytext1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 15,
                          color: Color(0xFF8C8C8C),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          bodytext2,
                          style: const TextStyle(
                            color: Color(0xFF8C8C8C),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                      ),
                      child: Text(
                        bodytext3,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 38,
                ),
                title: Text(
                  bottomtext1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  bottomtext2,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
