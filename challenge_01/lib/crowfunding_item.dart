class CrowfundingItem {
  final String author;
  final String category;
  final String title;
  final String description;

  final double moneyAchieved;
  final double moneyNeeded;
  final int backers;
  final int daysToGo;

  const CrowfundingItem(
      {this.author,
      this.category,
      this.title,
      this.description,
      this.moneyAchieved,
      this.moneyNeeded,
      this.backers,
      this.daysToGo});
}

const kCrowfundingItems = const <CrowfundingItem>[
  const CrowfundingItem(
      author: 'Joaquim P.',
      category: 'Game',
      title: 'Sustentability S/A: A mobile game about managing business',
      description:
          ' Lorem ipsum dolor sit amet consectetur adipiscing elit hendrerit ornare quisque senectus',
      moneyAchieved: 75.000,
      moneyNeeded: 100.000,
      backers: 300,
      daysToGo: 30)
];
