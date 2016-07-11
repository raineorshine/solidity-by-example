import 'OtherContract.sol'

contract MyContract {
  OtherContract other;
  function MyContract(address otherAddress) {
    other = OtherContract(otherAddress);
  }
  function Foo() {
    other.Bar();
  }
}