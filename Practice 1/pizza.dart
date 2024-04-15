class Pizza {

  String name = "";
  String description = "";
  int cost1 = 0;
  int cost2 = 0;
  int cost3 = 0;

  Pizza(int type) {
    switch(type) {
      case 1:
        name = "Cheese Pizza";
        description = "Cheese pizza so good and cheesy";
        cost1 = 10;
        cost2 = 20;
        cost3 = 30;
        break;
      case 2:
        name = "Vegetarian Pizza";
        description = "Vegetarian pizza so healthy and has vegetables";
        cost1 = 15;
        cost2 = 25;
        cost3 = 35;
        break;
      case 3:
        name = "Pineapple Pizza";
        description = "Pineapple pizza yuckie please stay away from me";
        cost1 = 17;
        cost2 = 27;
        cost3 = 36;
        break;
      case 4:
        name = "Random Pizza";
        description = "Pizza? Get a random pizza with luck";
        cost1 = 13;
        cost2 = 22;
        cost3 = 33;
        break;
      default:
        break;
    }
  }
}