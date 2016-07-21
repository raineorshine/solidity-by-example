contract One{
    string public word;

    function setMsg(string whatever) {
        word = whatever;
    }
}

contract Two{
    function Two(){
        One o = One(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);
        o.setMsg.value(0)("test");
    }
}