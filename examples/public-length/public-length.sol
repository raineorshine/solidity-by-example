contract A {
    uint[] public nums;
    function GetNumLength() returns(uint) {
        return nums.length;
    }
}

contract B {
    A a;
    
    function Test() constant returns (uint) {
        // length is not accessible on public array from other contract
        //return a.nums.length();
        return a.GetNumLength();
    }
}