import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

// create an actor (contains canister) in motoko = create a class 
actor DBank {

  // stable var >> orthogonal persistance (by default, a variable is flexible)
  stable var currentValue: Float = 300;
  currentValue := 300;
  // Debug.print(string), add debug_show for numbers
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));


  let id = 85478512612;
  // Debug.print(debug_show(id));


  // UPDATE FUNCTIONS = fonctions de MAJ -> modif de l'état de qqch

  public func topUp(amount: Float){
    currentValue += amount;
    // Debug.print(debug_show(currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  public func withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("The amount you've entered is greater than the money in the bank");
    }
  };

  // QUERY FUNCTIONS (requêtes): lecture d'une donnée = exécution plque rapide que les functions de MAJ
  public query func checkBalance(): async Float {
    return currentValue;
  };

  
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

};
