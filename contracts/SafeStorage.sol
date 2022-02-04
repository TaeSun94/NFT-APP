// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract SafeStorage{

    event Deposit(uint256 amount);
    event WithDrawal(uint256 amount);
    address public owner;
    using SafeMath for uint256;
    mapping(address => uint256) public storageBalance;

    function getBalance(address _token, address _owner) public view returns (uint256) {
        return IERC20(_token).balanceOf(_owner);
    }
    function getMe() public view returns(address){
        return msg.sender;
    }

    constructor(){
        owner = msg.sender;
    }

    function deposit(address token, uint256 _amount) public{
        IERC20(token).approve(address(this), IERC20(token).balanceOf(msg.sender));
        IERC20(token).transferFrom(msg.sender, address(this), _amount);
        if(storageBalance[msg.sender] == 0){
            storageBalance[msg.sender] = _amount;
        }
        else{
            // storageBalance[msg.sender] = storageBalance[msg.sender].add(_amount);
            storageBalance[msg.sender] += _amount;
        }
        emit Deposit(_amount);
    }

    function getMyStorageBalance(address _owner) public view returns (uint256){
        return storageBalance[_owner];
    }

    function withDrawal(address token, uint256 _amount) public {
        IERC20(token).transfer(msg.sender,_amount);
        // storageBalance[msg.sender] = storageBalance[msg.sender].sub(_amount);
        storageBalance[msg.sender] -= _amount;
        emit WithDrawal(_amount);
    }
}