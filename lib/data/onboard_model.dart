class OnBoardModel{
  String image;
  String text;

  OnBoardModel({
    required this.image,
    required this.text,
  });
}

List<OnBoardModel> screens = <OnBoardModel>[
  OnBoardModel(image: 'assets/images/onboard1.png', text: 'Bienvenue dans le monde passionnant du hockey grâce à notre application mobile destinée aux fans comme vous!'),
  OnBoardModel(image: 'assets/images/onboard2.png', text: 'Découvrez les derniers matchs en cours, suivez l\'action en direct et plongez-vous dans l\'excitation du monde du hockey.'),
  OnBoardModel(image: 'assets/images/onboard3.png', text: 'Parcourez les actualités les plus récentes, restez informé sur les dernières tendances et ne manquez jamais un moment crucial.'),
];