// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract Test{

    event Deposit(uint256 amount);
    event WithDrawal(uint256 amount);
    using SafeMath for uint256;

    mapping(address => uint256) public storageBalance;

    function getBalance(address _token) public view returns (uint256) {
        return IERC20(_token).balanceOf(msg.sender);
    }
    function getMe() public view returns(address){
        return msg.sender;
    }

    function getERC20Token(address _token, address owner) public returns(uint256){
        require(IERC20(_token).approve(address(this),IERC20(_token).balanceOf(owner)),"Can't Approve");
        require(IERC20(_token).allowance(owner,address(this)) == IERC20(_token).balanceOf(owner),"No Approve");
        IERC20(_token).transferFrom(owner, address(this), 10);
        return IERC20(_token).allowance(owner, address(this));
    }
    
    function transfer(address _token) public returns(uint256){
        IERC20(_token).transfer(address(this), IERC20(_token).balanceOf(msg.sender));

        return IERC20(_token).balanceOf(msg.sender);
    }

    // function deposit(address token, uint256 _amount) public{
    //     IERC20(token).approve(address(this), IERC20(token).balanceOf(msg.sender));
    //     IERC20(token).transferFrom(msg.sender, address(this), _amount);
    //     if(storageBalance[msg.sender] == 0){
    //         storageBalance[msg.sender] = _amount;
    //     }
    //     else{
    //         // storageBalance[msg.sender] = storageBalance[msg.sender].add(_amount);
    //         storageBalance[msg.sender] += _amount;
    //     }
    //     emit Deposit(_amount);
    // }

    // function getMyStorageBalance(address _owner) public view returns (uint256){
    //     return storageBalance[_owner];
    // }

    // function withDrawal(address token, uint256 _amount) public {
    //     IERC20(token).transfer(msg.sender,_amount);
    //     // storageBalance[msg.sender] = storageBalance[msg.sender].sub(_amount);
    //     storageBalance[msg.sender] -= _amount;
    //     emit WithDrawal(_amount);
    // }
}