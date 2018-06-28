pragma solidity ^0.4.4;

library SampleLib{
    function double(uint amount) public pure returns (uint doubledAmount)
    {
        return amount * 2;
    }
}
