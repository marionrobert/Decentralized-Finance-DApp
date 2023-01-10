import Debug "mo:base/Debug";

// create an actor (contains canister) in motoko = create a class 
actor DBank {
  // current money in bank 
  var currentValue = 300;
  currentValue := 100;

  // Debug.print(string)
  // but to print a number, add debug_show
  Debug.print(debug_show(currentValue));

  let id = 85478512612;
  // Debug.print(debug_show(id));


  // UPDATE FUNCTIONS = fonctions de MAJ, modif d'une variable, de l'état de qqch

  public func topUp(amount: Nat){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  // Decrease the currentValue by the amount
  public func withdrawl(amount: Nat){
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("The amount you've entered is greater than the money in the bank");
    }
  };

  // QUERY FUNCTIONS (requêtes): lecture d'une donnée = exécution plque rapide que les functions de MAJ
  public query func checkBalance(): async Nat {
    return currentValue;
  };

  // topUp();
};
