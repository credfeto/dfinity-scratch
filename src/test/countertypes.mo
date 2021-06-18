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


};