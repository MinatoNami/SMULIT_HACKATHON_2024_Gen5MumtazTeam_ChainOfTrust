import Buffer "mo:base/Buffer";

actor Counter {
    let logs = Buffer.Buffer<Text>(2);
    // var count = 0;

    public func append(val: Text): async () {
        logs.add(val);
    };

    public func read_array() : async [Text] { logs.toArray() };

    public func clear(): async () {
        logs.clear()
    }
};
