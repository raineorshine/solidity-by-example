contract Contract {
    uint[] public values;

    function Contract() {
    }
    
    function Find(uint value) returns(uint) {
        uint i = 0;
        while (values[i] != value) { 
            i++; 
        }
        return i;
    }
    
    function RemoveByValue(uint value) {
        uint i = Find(value);
        RemoveByIndex(i);
    }
    
    function RemoveByIndex(uint i) {
        while (i<values.length-1) {
            values[i] = values[i+1];
            i++;
        }
        values.length--;
    }
    
    function GetValues() constant returns(uint[]) {
        return values;
    }
    
    function Test() returns(uint[]) {
        values.push(10);
        values.push(20);
        values.push(30);
        values.push(40);
        values.push(50);
        RemoveByValue(30);
        return GetValues();
    }
}