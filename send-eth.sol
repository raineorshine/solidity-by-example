contract MyContract {

    address a = 0x123;

    function foo() {

        // send ether with default 21,000 gas
        // likely causes OOG in callee
        a.send(1 ether);

        // send ether with all remaining gas
        // but no success check!
        a.call.value(1 ether)();

        // RECOMMENDED
        // send all remaining gas
        // explicitly handle callee throw
        if(!a.call.value(1 ether)()) throw;
    }
}
