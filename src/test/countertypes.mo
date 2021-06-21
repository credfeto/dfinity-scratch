import Principal "mo:base/Principal";
import Nat "mo:base/Nat";

module CounterTypes = {

 public type AccountIdentifier = Text;

 public type User = {
    #address : AccountIdentifier; //No notification
    #principal : Principal; //defaults to sub account 0
  };

  public type NotifyService = actor 
     { 
          countChanged : shared (Nat) -> async()
     };


  public func toNotifier(principal: Principal) : NotifyService
     { 
          let ns : NotifyService = actor(Principal.toText(principal));

          return ns;
     };

  public func NotifyPrincipal(principal: Principal, value: Nat) : async()
  {
     let ns : NotifyService = toNotifier(principal);
     await ns.countChanged(value);
  }

};