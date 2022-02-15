// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
contract MultiToken is ERC1155, Ownable, Pausable, ERC1155Burnable, ERC1155Supply {
    //FT Token
    mapping (uint256 => mapping(address => uint256)) public balances;
    //For Air Drop NFT Token
    mapping (uint256 => mapping (address => uint256)) public claims;
    
    // string contractURI;

    constructor() ERC1155("") {}

    // function setContractURI(string memory _uri) public onlyOwner {
    //     contractURI = _uri;
    // }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function createFT(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
        whenNotPaused
    {
        _mint(account, id, amount, data);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
        whenNotPaused
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
        whenNotPaused
    {
        _mintBatch(to, ids, amounts, data);
    }

    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        whenNotPaused
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}