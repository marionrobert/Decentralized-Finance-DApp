import Debug "mo:base/Debug";

// create an actor (contains canister) in motoko = create a class 
actor DBank {
  // current money in bank 
  var currentValue = 300;
  currentValue := 100;

  let id = 85478512612;

  // Debug;print(string)
  // but to print a number, add debug_show
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));
};
