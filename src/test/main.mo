import Principal "mo:base/Principal";

actor Counter {

 public type AccountIdentifier = Text;

 public type User = {
    #address : AccountIdentifier; //No notification
    #principal : Principal; //defaults to sub account 0
  };

  public type NotifyService = actor 
     { 
          countChanged : shared (Nat) -> async()
     };

  var count = 0;

  public shared(msg) func inc(user: User) : async () { 
    count += 1;
    await notify(user, count);
  };

  public shared(msg) func read() : async Nat { count };

  public shared(msg) func bump(user: User) : async Nat {
    count += 1;
    
    await notify(user, count);

    return count;
  };

  public shared(msg) func reset(user: User) : async() {
    count := 0;
    await notify(user, count);
  };

  private func notify(user: User, value: Nat) : async() {

    switch(user) {
      case (#address address) {
         // nothing to do here - do not notify
      };

      case (#principal principal) {
        let ns : NotifyService = actor(Principal.toText(principal));
        let r = await ns.countChanged(value);

      };
    }
  };
};
