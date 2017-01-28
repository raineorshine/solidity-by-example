contract A {
    uint[] public amounts;
    function Init(uint[] _amounts) {
        amounts = _amounts;
    }
}

contract Factory {
    struct AData {
        uint[] amounts;
    }
    mapping (address => AData) listOfData;
    
    function Set(uint[] _amounts) {
        listOfData[msg.sender] = AData(_amounts);
    }
    
    function Make() returns(address) {
        A a = new A();
        a.Init(listOfData[msg.sender].amounts);
        return address(a);
    }
}