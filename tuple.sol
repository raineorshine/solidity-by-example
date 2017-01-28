contract A {
    function Tuple() returns(uint, string) {
        return (1, "Hi");
    }
    
    function GetOne() returns(uint) {
        uint a;
        (a,) = Tuple();
        return a;
    }
}