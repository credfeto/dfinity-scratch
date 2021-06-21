import CounterTypes "countertypes";
import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor class Counter(init : Nat) {

  public type User = CounterTypes.User;

  public type NotifyService = CounterTypes.NotifyService;

  var count = init;

  public func inc(user: User) : async () { 
    count += 1;
    await notify(user, count);
  };

  public func read() : async Nat { count };

  public func bump(user: User) : async Nat {
    count += 1;
    
    await notify(user, count);

    return count;
  };

  public func reset(user: User) : async() {
    count := 0;
    await notify(user, count);
  };

  private func notify(user: User, value: Nat) : async() {

    Debug.print("---<<<< " # Nat.toText(value));

    switch(user) {
      case (#address address) {
         // nothing to do here - do not notify
      };

      case (#principal principal) {
        
        await CounterTypes.NotifyPrincipal(principal, value);
      };
    }
  };


};
