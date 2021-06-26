import Counter "counter";
import Principal "mo:base/Principal";
import _counter "mo:base/Array";

actor CounterFactory {

  public func getCounter() : async (Counter.Counter) {
    return await Counter.Counter(0);
  };
};
