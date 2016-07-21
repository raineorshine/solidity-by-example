contract Sha3 {
    function HashArray() constant returns(bytes32) {
        bytes8[] memory tickers = new bytes8[](4);
        tickers[0] = bytes8('BTC');
        tickers[1] = bytes8('ETH');
        tickers[2] = bytes8('LTC');
        tickers[3] = bytes8('DOGE');
        return sha3(tickers);
        // 0x374c0504f79c1d5e6e4ded17d488802b5656bd1d96b16a568d6c324e1c04c37b
    }
    
    function HashPackedArray() constant returns(bytes32) {
        bytes8 btc = bytes8('BTC');
        bytes8 eth = bytes8('ETH');
        bytes8 ltc = bytes8('LTC');
        bytes8 doge = bytes8('DOGE');
        return sha3(btc, eth, ltc, doge);
        // 0xe79a6745d2205095147fd735f329de58377b2f0b9f4b81ae23e010062127f2bc
    }
    
    function HashAddress() constant returns(bytes32) {
        address account = 0x6779913e982688474f710b47e1c0506c5dca4634;
        return sha3(bytes20(account));
        // 0x229327de236bd04ccac2efc445f1a2b63afddf438b35874b9f6fd1e6c38b0198
    }
    
    function TestPackedArgs() constant returns (bool) {
        return sha3('ab') == sha3('a', 'b');
    }
    
    function HashHex() constant returns (bytes32) {
        return sha3(0x0a);
        // 0x0ef9d8f8804d174666011a394cab7901679a8944d24249fd148a6a36071151f8
    }

    function HashInt() constant returns (bytes32) {
        return sha3(int(1));
    }

    function HashNegative() constant returns (bytes32) {
        return sha3(int(-1));
    }

    function Hash8() constant returns (bytes32) {
        return sha3(1);
    }

    function Hash32() constant returns (bytes32) {
        return sha3(uint32(1));
    }

    function Hash256() constant returns (bytes32) {
        return sha3(uint(1));
    }

    function HashEth() constant returns (bytes32) {
        return sha3(uint(100 ether));
    }
    
    function HashWei() constant returns (bytes32) {
        return sha3(uint(100));
    }
    
    function HashMultipleArgs() constant returns (bytes32) {
        return sha3('a', uint(1));
    }
    
    function HashString() constant returns (bytes32) {
        return sha3('a');
    }
}