contract MyContract {
    string[] strings;

    function MyContract() {
        strings.push("hi");
        strings.push("bye");
    }

    function bar() constant returns(string) {
        return strings[1];
    }
}