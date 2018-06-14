class Scene {
  final shortDescription;
  final cityName;
  final image;
  final area;
  final population;
  final longDescription;

  Scene(this.shortDescription, this.cityName, this.image, this.area,
      this.population, this.longDescription);
}

List kScenes = [
  Scene("Build Scenary", "Venice", "place01.jpg", 414.75, 34.3,
      "The necks of the Loch Ness Monster-like  marine reptiles known as plesiosaurs could reach an impressive 23 feet, probably because the water they lived in could support their weight"),
  Scene("Natural Scenary", "Venice", "place02.jpg", 414.75, 34.3,
      "The necks of the Loch Ness Monster-like  marine reptiles known as plesiosaurs could reach an impressive 23 feet, probably because the water they lived in could support their weight"),
  Scene("Famous Scenary", "Venice", "place03.jpg", 414.75, 34.3,
      "The necks of the Loch Ness Monster-like  marine reptiles known as plesiosaurs could reach an impressive 23 feet, probably because the water they lived in could support their weight")
];
