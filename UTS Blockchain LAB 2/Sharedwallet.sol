//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

import "./Allowance.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";

    function reduceAllowance(address _who, uint _amount) internal ownerOrAllowed(_amount) {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who] - _amount);
        allowance[_who] -= _amount;
        }
    contract Sharedwallet is Allowance{
        event MoneySent(address indexed _beneficiary, uint _amount);
        event MoneyReceived(address indexed _from, uint _amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Contract doesn't own enough money");
       if(!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
            emit MoneySent(_to, _amount);
            _to.transfer(_amount);
        }
        function renounceOwnership() public override onlyOwner {
            revert("can't renounceOwnership here"); //not possible with this smart contract
}

    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    
    }
}