import Counter "counter";
import Principal "mo:base/Principal";
import _counter "mo:base/Array";

actor CounterFactory {

 public type AccountIdentifier = Text;

 public type User = {
    #address : AccountIdentifier; //No notification
    #principal : Principal; //defaults to sub account 0
  };

  public type NotifyService = actor 
     { 
          countChanged : shared (Nat) -> async()
     };

  public func getCounter() : async (Counter.Counter) {
    return await Counter.Counter(0);
  };
};
