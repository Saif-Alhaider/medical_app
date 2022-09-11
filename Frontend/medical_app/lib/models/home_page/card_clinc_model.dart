class ClincCardMol {
  String img;
  String name;
  String des;
  String govern;
  int rate;
  int rival;

  ClincCardMol({
    required this.img,
    required this.name,
    required this.des,
    required this.govern,
    required this.rate,
    required this.rival,
  });
}
List<ClincCardMol> ClincList =[
  ClincCardMol(img: 'Assets/images/clincs/clinc1.png', name: 'عيادة الهدى', des: 'فحوصات شاملة', govern: 'ذي قار, صلاح الدين', rate: 4, rival: 35),
  ClincCardMol(img: 'Assets/images/clincs/clinc1.png', name: 'عيادة الهدى', des: 'فحوصات شاملة', govern: 'ذي قار, صلاح الدين', rate: 4, rival: 35),
  ClincCardMol(img: 'Assets/images/clincs/clinc1.png', name: 'عيادة الهدى', des: 'فحوصات شاملة', govern: 'ذي قار, صلاح الدين', rate: 4, rival: 35),
  ClincCardMol(img: 'Assets/images/clincs/clinc1.png', name: 'عيادة الهدى', des: 'فحوصات شاملة', govern: 'ذي قار, صلاح الدين', rate: 4, rival: 35),
];