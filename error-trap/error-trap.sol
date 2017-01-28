contract ContractTrapped {
    function foo(uint a) constant returns(string, uint) {
        uint nullReturn;
        if(a < 100) {
            return('Too small', nullReturn);
        }
        uint b = 5;
        return ('', b);
    }
}