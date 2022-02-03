// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SafeStorage{
    ERC20 public token;

    event Store(uint256 amount);
    event Out(uint256 amount);
    address tokenAddress = 0xc41B5E5f8EBa25c77B38aaf01AcC62eE7d4E5F30;

    // constructor() public {
    //     token = new ERC20();
    // }

    using SafeMath for uint256;
    mapping(address => uint256) public storageBalance;

    // function setStorage() public {
    //     storageBalance[msg.sender] = 0;
    // }
    
    function deposit(uint256 _amount) public returns (uint256){
        ERC20(tokenAddress).approve(msg.sender, _amount);
        ERC20(tokenAddress).transferFrom(msg.sender, address(this),_amount);
        if(storageBalance[msg.sender] == 0){
            storageBalance[msg.sender] = _amount;
        }
        else{
            storageBalance[msg.sender]= storageBalance[msg.sender].add(_amount);
        }
        emit Store(_amount);
        return storageBalance[msg.sender];
    }

    function getMyStorageBalance(address _owner) public view returns (uint256){
        require(msg.sender == _owner);
        return storageBalance[msg.sender];
    }

    function withDrawal(uint256 _amount) public returns (uint256){
        ERC20(tokenAddress).transfer(msg.sender,_amount);
        storageBalance[msg.sender] = storageBalance[msg.sender].sub(_amount);
        emit Out(_amount);
        return storageBalance[msg.sender];
    }
}