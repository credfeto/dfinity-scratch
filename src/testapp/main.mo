import Counters "canister:test";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";

actor CountToTen {

  public type User = Counters.User;

  public shared(msg) func countToTen() : async () {

    let u : User = #principal(Principal.fromActor(CountToTen));

    await Counters.reset(u);

    while ((await Counters.read()) < 10) {
      Debug.print(Nat.toText(await Counters.read()));
      await Counters.inc(u);
      Debug.print("Hello");
    };
  };

  public func countChanged(value: Nat) : async() {
     Debug.print("--->>>> " # Nat.toText(value));
  }
};
