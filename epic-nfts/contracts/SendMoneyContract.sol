pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "hardhat/console.sol";

contract SendMoneyContract {
    using SafeMath for uint256;

    address payable public owner;
    mapping(address => uint256) public balanceReceived;

    constructor() {
        owner = payable(msg.sender);
    }

    function sendMoneyToOwner(uint256 _amount) public returns (bool) {
        console.log(balanceReceived[msg.sender]);
        require(balanceReceived[msg.sender] >= _amount, "Not Enough Money");

        balanceReceived[msg.sender] = balanceReceived[msg.sender].sub(_amount);
        balanceReceived[owner] = balanceReceived[owner].add(_amount);

        return true;
    }
}
